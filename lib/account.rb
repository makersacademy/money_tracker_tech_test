require_relative './transaction'

class Account
  attr_reader :balance, :transactions, :debit

  def initialize
    @balance = 0
    @debit = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << Transaction.new(amount, balance, debit)
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << Transaction.new(amount, balance, debit)
  end

  def debit
    if balance < 0
      @debit = balance.abs
    end
    @debit
  end

end
