class Ledger
  attr_accessor :transactions, :balance

  def initialize
    @transactions = []
  end

  def add_record(record)
    @transactions << record
  end
end
