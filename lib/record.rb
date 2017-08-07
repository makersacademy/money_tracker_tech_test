class Record

  attr_reader :amount, :date

  def initialize(amount, date)
    @amount = amount
    @date = date
  end

  def add(ledger)
    ledger.transactions << {@amount => @date}
  end
end
