class TransactionLog

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def log(transaction)
    @transactions << transaction
  end
end
