class Account
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def get_balance
    @balance
  end

  def deposit(value)
    @balance += value
  end

  def withdraw(value)
    @balance -= value
  end

end
