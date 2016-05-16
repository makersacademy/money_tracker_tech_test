class Account
  STARTING_BALANCE = 100

  def initialize(balance: STARTING_BALANCE)
    @balance = balance
  end

  def get_balance
    @balance
  end
end
