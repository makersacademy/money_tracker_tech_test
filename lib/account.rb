require_relative 'statement.rb'

class Account

  attr_reader :balance

  def initialize(statement: Statement)
    @balance = 0
    @statement = Statement.new
  end

  def deposit(amount)
    @statement.add_transaction(balance: @balance, deposit: amount)
    @balance += amount
  end

  def withdraw(amount)
    @statement.add_transaction(balance: @balance, withdraw: amount)
    raise "You can only withdraw #{@balance}." if amount > @balance
    @balance -= amount
  end

  def print_statements
    @statement.print
  end
end