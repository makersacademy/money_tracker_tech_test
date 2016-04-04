class Bank

  attr_reader :balance, :date

  def initialize
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def set_date(chosen_date)
    @date = chosen_date
  end

end
