class Bank

  attr_reader :statement, :balance

  def initialize(balance=0)
    @balance = balance
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    @statement.push("Deposit:#{amount}, Balance:#{@balance}")
  end
  
  def withdraw(amount)
    @balance -= amount
    @statement.push("Withdrawal:#{amount}, Balance:#{@balance}")
  end
end