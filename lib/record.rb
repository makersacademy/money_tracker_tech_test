require 'date'

class Record
  attr_reader :date, :amount

  def initialize(date, amount)
    verify amount
    @date   = Date.parse(date)
    @amount = amount.to_f
  end

  def type
    amount >= 0 ? :credit : :debit
  end

  private

  def verify(amount)
    raise 'Invalid transaction amount' if amount.to_f.zero?
  end
end
