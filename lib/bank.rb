require './lib/statement.rb'

class Bank

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    @statement.input(Time.now, amount, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @statement.input(Time.now, -amount, @balance)
  end

  def request_statement
    @statement.print_out
  end

end
