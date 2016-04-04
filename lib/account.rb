class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def withdraw_funds(amount)
    @balance -= amount
  end

  def deposit_funds(amount)
    @balance += amount
  end
end
