require_relative 'transactions'

class Tracker
  attr_reader :transactions

  def initialize(transactions = Transactions.new)
    @transactions = transactions
  end

  def record_spending(amount, datestring)
    transactions.add_transaction(Spending, amount, datestring)
  end

  def record_earning(amount, datestring)
    transactions.add_transaction(Earning, amount, datestring)
  end

end
