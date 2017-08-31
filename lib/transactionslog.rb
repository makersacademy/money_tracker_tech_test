
require_relative 'transaction'

class TransactionsLog

  attr_reader :history

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @history = []
  end

  def withdraw(current_balance, amount)
    history << transaction_class.new(debit: amount, balance: current_balance)
  end

  def deposit(current_balance, amount)
    history << transaction_class.new(credit: amount, balance: current_balance)
  end

  private

  attr_reader :transaction_class
end
