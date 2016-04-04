
class Account

  attr_reader :balance, :statement

  def initialize
    @balance = 0;
    @statement = {};
  end

  def deposit(amount)
    @balance += amount
  end

end
