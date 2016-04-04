require './lib/statement.rb'

class Bank

  attr_reader :balance, :date

  def initialize(statement = Statement.new)
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    @statement.input(@date, amount, @balance)
    @balance
  end

  def withdraw(amount)
    @balance -= amount
    @statement.input(@date, amount, @balance)
    @balance
  end

  def set_date(chosen_date)
    @date = chosen_date
  end

end
