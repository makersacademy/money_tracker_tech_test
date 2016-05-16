class Account

STARTBALANCE = 10

  def initialize
    @balance = STARTBALANCE
  end

  def check_balance
    balance
  end
  
  def statement
    []
  end

  def deposit(amount)
    add_to_balance(amount)
  end

  def withdraw(amount)
    subtract_from_balance(amount)
  end

  private

  def balance
    @balance
  end

  def add_to_balance(amount)
    @balance += amount
  end

  def subtract_from_balance(amount)
    @balance -= amount
  end

end