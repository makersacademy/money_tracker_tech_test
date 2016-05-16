class TransactionHistory
  def initialize
    @all_transactions = []
  end

  attr_reader :all_transactions

  def add_transaction(transaction)
    @all_transactions << transaction
  end
end
