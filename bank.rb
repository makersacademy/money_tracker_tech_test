class Bank

  attr_reader :statement

  def initialize
    @balance = 0
    @statement = []
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount
    @statement << @balance
  end
  
  def withdraw(amount)
    @balance -= amount
  end
end