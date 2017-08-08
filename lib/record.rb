class Record
  attr_reader :amount, :date, :type

  def initialize(amount, date)
    @amount = check_validity(amount)
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

  def check_validity(amount)
    raise "0 is not a valid amount" if amount == 0
    amount
  end

  def set_type
    @amount < 0 ? :debit : :credit
  end
end
