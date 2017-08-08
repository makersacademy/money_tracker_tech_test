class Record
  attr_reader :amount, :date, :type

  def initialize(amount, date)
    @amount = check_validity(amount)
    @date = date
    @type = set_type
  end

  private

  def check_validity(amount)
    raise '0 is not a valid amount' if amount.zero?
    amount
  end

  def set_type
    @amount < 0 ? :debit : :credit
  end
end
