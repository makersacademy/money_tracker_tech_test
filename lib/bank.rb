require_relative 'statement'

class Bank

  attr_reader :balance, :statement

  BALANCE = 0

  def initialize(balance=BALANCE, statement = Statement.new)
    @balance = balance
    @statement = statement
  end

  def deposit(amount, date)
    @balance += amount
    @statement.credits[date] = amount
  end

  def withdraw(amount, date)
    @balance -= amount
    @statement.debits[date] = amount
  end


end
