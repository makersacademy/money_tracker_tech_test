require_relative 'transaction_history'
require_relative 'statement'

class Account
  attr_reader :balance, :transaction

  def initialize(transaction: TransactionHistory.new, statement: Statement.new)
    @balance = [0]
    @transaction = transaction
    @statement = statement
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

  def statement
    @statement.show(@transaction.history)
  end
end
