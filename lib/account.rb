require_relative 'statement'
require_relative 'transaction'

class Account
  # is responsible for the customers balance

  attr_reader :balance

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def print_statement
    @statement.print(@balance)
  end

  def deposit(amount, date = Time.now)
    add(amount)
    @statement.new_transaction(amount, 0, date)
  end

  def withdraw(amount, date = Time.now)
    subtract(amount)
    @statement.new_transaction(0, amount, date)
  end

  private

  def add(amount)
    @balance += amount
  end

  def subtract(amount)
    @balance -= amount
  end

end
