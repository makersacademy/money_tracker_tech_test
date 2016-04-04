require_relative 'statement'
require_relative 'printer'

class Bank

  attr_reader :balance, :statement

  BALANCE = 0

  def initialize(balance=BALANCE, statement = Statement.new, printer = Printer.new)
    @balance = balance
    @statement = statement
    @printer = printer
  end

  def deposit(amount, date)
    new_balance = @balance += amount
    statement.credits << [date, amount, new_balance]
  end

  def withdraw(amount, date)
    new_balance = @balance -= amount
    statement.debits << [date, amount, new_balance]
  end

  def print_statement
    @printer.print_records(@statement)
  end

end
