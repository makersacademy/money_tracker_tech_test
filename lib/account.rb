require_relative 'transaction_list'
require_relative 'transaction'

class Account

attr_reader :balance, :transactions

  def deposit(amount)
    @balance += amount
    new_deposit = Transaction.new(@balance, credit = amount)
    @transactions.add_to_list(new_deposit)
  end

  def withdraw(amount)
    @balance -= amount
    new_withdrawl = Transaction.new(@balance, credit = nil, debit = amount)
    @transactions.add_to_list(new_withdrawl)
  end

  def show_balance
    @balance
  end

  def display_statement
    @statement.display_transactions
  end

  private

  def initialize(balance = 0, transactions = TransactionList.new, statement = Statement.new(transactions))
    @balance = balance
    @transactions = transactions
    @statement = statement
  end
end
