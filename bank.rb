class Bank

  attr_reader :statement, :balance

  def initialize(balance=0)
    @balance = balance
    @statement = []
  end

  def deposit(amount, date=Time.now)
    @balance += amount
    @statement.push("Deposit:#{amount}, Balance:#{@balance}, Date:#{date}")
  end
  
  def withdraw(amount, date=Time.now)
    @balance -= amount
    @statement.push("Withdrawal:#{amount}, Balance:#{@balance}, Date:#{date}")
  end
end