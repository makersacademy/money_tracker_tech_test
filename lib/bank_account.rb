class BankAccount

  INITIAL_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = INITIAL_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
