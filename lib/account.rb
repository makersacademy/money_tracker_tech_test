
class Account

  INITIAL_BALANCE = 0

  attr_reader :transactions, :balance

  def initialize(statement, transactions)
    @transactions = transactions || Transactions.new
    @statement = statement || Statement
    @balance = INITIAL_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    check_enough_to_withdraw(amount)
    @balance -= amount
  end

  def check_enough_to_withdraw(amount)
    fail "You have insufficient funds to withdraw" if balance < amount
  end

end
