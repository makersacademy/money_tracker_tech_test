
require_relative "transaction"

class Transactions_Log

  attr_reader :history, :transaction

  def initialize(transaction = Transaction)
    @transaction = transaction
    @history = []
  end

  def withdraw(current_balance, amount)
    @history << transaction.new(debit: amount, balance: current_balance)
  end

  def deposit(current_balance, amount)
    @history << transaction.new(credit: amount, balance: current_balance)
  end

end
