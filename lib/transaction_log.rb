class TransactionLog

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_new(transaction)
    @transactions << transaction
  end
end
