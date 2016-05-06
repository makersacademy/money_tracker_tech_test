require 'statement'

class Account
  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def withdraw_funds(amount)
    @balance -= amount
    @statement.calculate_statement(amount, :withdraw, @balance)
  end

  def deposit_funds(amount)
    @balance += amount
    @statement.calculate_statement(amount, :deposit, @balance)
  end

  private

  attr_reader :balance

end
