class Account

  attr_reader :balance, :statement_history

  OVERDRAFT_LIMIT = 0

  def initialize
    @balance = 0
    @statement_history = []
  end

  def deposit(amount)
    @balance += amount
    @statement_history <<  {date: Time.now, amount: amount, balance: @balance}
  end

  def withdraw(amount)
    fail "action couldn't be completed, not enough funds available" if @balance - amount < OVERDRAFT_LIMIT
    @balance -= amount
    @statement_history <<  {date: Time.now, amount: amount, balance: @balance}
  end

end