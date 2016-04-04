# require 'bank.rb'

class Customer

  attr_reader :balance, :statement, :current_transaction

  def initialize
    @balance = 0
    @statement = []
    @current_transaction = {}
  end

  def credit_account(amount, date)
    @balance += amount
    @current_transaction = {date: date, credit: amount, balance: @balance}
    update_statement
  end

  def debit_account(amount, date)
    @balance -= amount
    @current_transaction = {date: date, debit: amount, balance: @balance}
    update_statement
  end

  def update_statement
    @statement << @current_transaction
  end

end
