# require 'bank.rb'

class Customer

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def credit_account(amount, date)
    @balance += amount
  end

  def debit_account(amount, date)
    @balance -= amount
  end

end
