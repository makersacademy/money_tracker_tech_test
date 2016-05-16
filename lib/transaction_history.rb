require_relative 'transaction'

class TransactionHistory

  attr_reader :transaction, :history, :date, :amount

  def initialize(transaction: Transaction)
    @transaction = transaction
    @history = []
  end

  def add(date, amount)
    transaction = @transaction.new
    transaction.value(date, amount)
    @history << transaction.details
  end
end
