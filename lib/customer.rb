# require 'bank.rb'

class Customer

  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = {}
  end

  def credit_account(amount, date)
    @balance += amount
  end

  def debit_account(amount, date)
    @balance -= amount
  end

end
