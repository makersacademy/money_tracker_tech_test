require './lib/statement.rb'

class Bank

  attr_reader :balance, :date

  def initialize(statement = Statement.new)
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
    @statement = statement
  end

  def deposit(amount)
    @statement.input(@date, amount)
    @balance += amount
  end

  def withdraw(amount)
    @statement.input(@date, amount)
    @balance -= amount
  end

  def set_date(chosen_date)
    @date = chosen_date
  end

end
