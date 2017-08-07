require 'date'

class Ledger
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def record(transaction)
    save_record(transaction)
  end

  private

  def save_record(transaction)
    transactions.push(transaction)
  end
end
