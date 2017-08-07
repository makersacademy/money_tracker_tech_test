require "./lib/ledger.rb"

class Record

  attr_reader :amount, :date

  def initialize(amount, date)
    @amount = amount
    @date = date
  end

  def add(ledger)
    ledger.transactions << self.format
  end

  def format
    {amount: @amount, date: @date}
  end
end
