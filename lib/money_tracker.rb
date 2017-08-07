class MoneyTracker

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def credit(amount)
    @balance += amount
  end
end
