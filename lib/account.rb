require_relative 'transaction_history'
require_relative 'statement'

class Account
  attr_reader :balance, :transaction

  def initialize(transaction: TransactionHistory.new, statement: Statement.new)
    @transaction = transaction
    @statement = statement
  end

  def deposit(date, amount)
    @transaction.add(date, amount)
    balance
  end

  def withdraw(date, amount)
    @transaction.add(date, -amount)
    balance
  end

  def balance
    balance = [0]
    @transaction.history.each { |detail| balance << detail[:amount] }
    @transaction.history.last[:balance] += balance.reduce(:+)
    return balance.reduce(:+)
  end

  def statement
    @statement.show(@transaction.history)
  end
end
