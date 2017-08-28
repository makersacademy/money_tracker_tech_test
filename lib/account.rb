
require_relative 'statement'
require_relative 'transactionslog'

class Account
  START_BALANCE = 0

  attr_reader :balance

  def initialize(transactions_log = TransactionsLog.new)
    @transactions_log = transactions_log
    @balance = START_BALANCE
  end

  def deposit(amount)
    @balance += amount
    transactions_log.deposit(balance, amount)
  end

  def withdraw(amount)
    @balance -= amount
    transactions_log.withdraw(balance, amount)
  end

  def get_statement
    statement = Statement.new(transactions_log)
    statement.print_it
  end

  private

  attr_reader :transactions_log
end
