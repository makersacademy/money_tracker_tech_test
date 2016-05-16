class Account

  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = [] 
  end

  def deposit(amount, date)
    @balance += amount
    @statement << amount
  end

  def withdraw(amount, date)
    @balance -= amount
    @statement << amount * -1
  end

end
