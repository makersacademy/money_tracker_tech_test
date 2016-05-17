require_relative 'transaction_history'

class BankAccount

  AVAILABLE_BALANCE_ERROR = 'Not enough balance to withdraw'

  attr_reader :balance, :transaction_history

  def initialize(transaction_history = TransactionHistory.new )
    @balance = 0
    @transaction_history = transaction_history
  end

  def deposit date, amount
    @balance += amount
    @transaction_history.deposit(date, amount, @balance)
  end

  def withdraw date, amount
    raise AVAILABLE_BALANCE_ERROR if @balance - amount <= 0
    @balance -= amount
    @transaction_history.withdraw(date, amount, @balance)
  end

  def print_statement
    @transaction_history.print_statement
  end
end
