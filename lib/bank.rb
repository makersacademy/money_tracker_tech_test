
require_relative 'statement'
require_relative 'transactions_log'

class Bank
  START_BALANCE = 0

  attr_reader :balance

  def initialize(transactions_log = Transactions_Log.new)
    @transactions_log = transactions_log
    @balance = START_BALANCE
  end

  def deposit(amount)
    @balance += amount
    transactions_log.deposit(balance, amount)
  end

  def withdraw(amount)
    check_enough_to_withdraw(amount)
    @balance -= amount
    transactions_log.withdraw(balance, amount)
  end

  def get_statement
    statement = Statement.new(transactions_log)
    statement.print_it
  end

  private

  attr_reader :transactions_log

  def check_enough_to_withdraw(amount)
    raise "You don't have enough to withdraw" if balance < amount
  end
end
