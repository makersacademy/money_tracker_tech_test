
class Account

  attr_reader :balance, :statement

  def initialize
    @balance = 0;
    @statement = {};
  end

  def deposit(amount, date)
    @balance += amount
  end

  def withdraw(amount, date)
    @balance -= amount
  end

end
