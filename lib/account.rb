class Account
  STARTING_BALANCE = 100

  def initialize(log: TransactionHistory.new, balance: STARTING_BALANCE, pin:1234)
    @balance = balance
    @pin = pin
    @log = log
  end

  attr_reader :balance

  def make_deposit(amount)
    @balance += amount if valid_deposit(amount)
  end

  def withdraw(amount, pin)
    @balance -= amount if valid_withdraw(amount) && valid_pin(pin)
  end

  private

  def valid_deposit(amount)
    (amount.is_a? Numeric) && amount > 0
  end

  def valid_withdraw(amount)
    (amount.is_a? Numeric) && amount > 0 && amount <= @balance
  end

  def valid_pin(pin)
    @pin == pin
  end
end
