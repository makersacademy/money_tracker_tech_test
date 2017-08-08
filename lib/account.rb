require_relative 'transaction_list'
require_relative 'transaction'
require_relative 'statement'

class Account

attr_reader :balance, :transactions

  def create_entry(amount, transaction = Transaction.new)
    @balance += amount
    transaction.set_attributes(amount, @balance)
    @transactions.add_to_list(transaction)
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
