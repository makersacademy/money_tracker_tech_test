class Ledger
  attr_accessor :transactions, :balance

  def initialize
    @transactions = []
    @balance ||= 0
  end

  def add_record(record)
    @transactions << record
  end

  def update_balance
    @balance = @transactions.map { |record| record.amount }.reduce(:+)
  end

end
