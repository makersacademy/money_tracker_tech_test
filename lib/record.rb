require 'date'

class Record
  attr_reader :amount, :date, :type

  def initialize(amount, date)
    @amount = check_validity(amount)
    @date = Date.parse(date)
    @type = evaluate_type
  end

  private

  def check_validity(amount)
    raise '0 is not a valid amount' if amount.zero?
    amount
  end

  def evaluate_type
    @amount < 0 ? :debit : :credit
  end
end
