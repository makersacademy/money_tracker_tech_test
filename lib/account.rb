require 'statement'

class Account

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def withdraw_funds(amount)
    @balance -= amount
    credit_statement(amount)
  end

  def deposit_funds(amount)
    @balance += amount
    debit_statement(amount)
  end

  private

  attr_reader :balance

  def credit_statement(amount)
    @statement.calculate_statement(amount, :withdraw, @balance)
  end

  def debit_statement(amount)
    @statement.calculate_statement(amount, :deposit, @balance)
  end
end
