class Account
  attr_reader :balance
  def initialize()
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawal(amount)
      fail 'You do not have enough funds' if amount > @balance
      @balance -= amount
  end
end
