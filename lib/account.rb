class Account
  STARTING_BALANCE = 100

  def initialize(balance: STARTING_BALANCE)
    @balance = balance
  end

  def get_balance
    @balance
  end

  def make_deposit(amount)
    @balance += amount
  end
end
