require_relative 'transaction_history'

class Account
  attr_reader :balance, :transaction

  def initialize(transaction: TransactionHistory.new)
    @balance = [0]
    @transaction = transaction
  end

  def deposit(date, amount)
    @transaction.add(date, amount)
  end

  def withdraw(date, amount)
    @transaction.add(date, -amount)
  end

  def balance
    @transaction.history.each { |detail| @balance << detail[:amount] }
    @balance.reduce(:+)
  end

  # def statement
  #   "date || credit || debit || balance\n
  #   #{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.credit}"
  # end
end
