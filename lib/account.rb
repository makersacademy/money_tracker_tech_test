require_relative 'statement.rb'

class Account 

  attr_reader :balance

  def initialize(statements: Statements)
    @balance = 0
    @statements = Statements.new
  end

  def deposit(amount)
    @statements.create_statement(balance: @balance, deposit: amount)
    @balance += amount
  end

  def withdraw(amount)
    @statements.create_statement(balance: @balance, withdraw: amount)
    raise "You can only withdraw #{@balance}." if amount > @balance
    @balance -= amount
  end

  def print_statements
    @statements.print
  end

  def statement
    @statements.statement
  end
end