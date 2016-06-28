class Account

  attr_reader :balance

  OVERDRAFT_LIMIT = 0

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    fail "action couldn't be completed, not enough funds available" if @balance - amount < OVERDRAFT_LIMIT
    @balance -= amount
  end

end