class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def accept_deposit(amount)
    @balance += amount
  end

  def accept_withdrawal(amount)
    @balance -= amount
  end

end
