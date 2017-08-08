class Ledger
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def record(transaction)
    transactions.push(transaction)
  end
end
