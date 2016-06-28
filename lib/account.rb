require 'date'

class Account
  attr_reader :balance, :statement
  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    @statement.push({date: Time.now.strftime("%d/%m/%Y"), amount: amount, balance: @balance})
  end

  def withdrawal(amount)
      fail 'You do not have enough funds' if amount > @balance
      @balance -= amount
  end
end
