class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(date, amount)
    @balance = @balance + amount
  end

end
