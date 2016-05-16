require_relative 'transaction'

class Account
  attr_reader :balance, :transaction

  def initialize(balance=0, transaction: Transaction.new)
    @balance = balance
    @transaction = transaction
  end

  def deposit(date, amount)
    @transaction.value(date, amount)
    @balance += @transaction.details[:amount]
  end

  def withdraw(date, amount)
    @transaction.value(date, amount)
    @balance -= @transaction.details[:amount]
  end

  # def statement
  #   "date || credit || debit || balance\n
  #   #{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.credit}"
  # end
end
