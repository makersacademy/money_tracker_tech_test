class Account
  STARTING_BALANCE = 100

  def initialize(balance: STARTING_BALANCE)
    @balance = balance
  end

  def get_balance
    @balance
  end

  def make_deposit(amount)
    @balance += amount if valid_deposit(amount)
  end

  def withdraw(amount)
    @balance -= amount if valid_withdraw(amount)
  end

  private

  def valid_deposit(amount)
    (amount.is_a? Numeric) && amount > 0
  end

  def valid_withdraw(amount)
    (amount.is_a? Numeric) && amount > 0 && amount <= @balance
  end
end
