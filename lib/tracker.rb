require_relative 'transactions'
require_relative 'statement'

class Tracker
  attr_reader :transactions, :statement

  def initialize(transactions = Transactions.new)
    @transactions = transactions
  end

  def record_spending(amount, datestring)
    transactions.add_transaction(Spending, amount, datestring)
  end

  def record_earning(amount, datestring)
    transactions.add_transaction(Earning, amount, datestring)
  end

  def display_statement
    @statement = Statement.new(transactions.transaction_list)
    statement.generate_statement
  end

end
