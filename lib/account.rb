require 'transaction'

class Account
  attr_reader :balance
  attr_reader :transactions
  attr_reader :debit

  def initialize
    @balance = 0
    @debit = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def debit
    if balance < 0
      @debit = balance.abs
    end
    @debit
  end
  
end
