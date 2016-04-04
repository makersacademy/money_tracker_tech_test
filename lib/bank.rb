class Bank

  attr_reader :balance

  BALANCE = 0

  def initialize(balance=BALANCE)
    @balance = balance
  end

  def deposit(amount, date)
    @balance += amount
  end

  def withdraw(amount, date)
    @balance -= amount
  end


end
