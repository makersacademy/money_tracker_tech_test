
require_relative "statement"
require_relative "transactions_log"


class Bank

  INITIAL_BALANCE = 0

  attr_reader :transactions, :statement, :balance

  def initialize(transactions = Transactions.new)
    @transactions = transactions
    @statement = statement
    @balance = INITIAL_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    check_enough_to_withdraw(amount)
    @balance -= amount
  end

  def print_statement
    statement = Statement.new(transactions)
  end

  def check_enough_to_withdraw(amount)
    fail "You don't have enough to withdraw" if balance < amount
  end

end
