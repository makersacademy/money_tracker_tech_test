class Record
  attr_reader :amount, :date, :type

  def initialize(amount, date)
    @amount = amount
    @date = date
    @type = set_type
  end

  def add_to(ledger)
    ledger.transactions << format_record
  end

  def format_record
    { amount: @amount.abs, date: @date, type: @type }
  end

  private

  def set_type
    @amount < 0 ? :debit : :credit
  end
end
