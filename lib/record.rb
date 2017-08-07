require 'date'

class Record
  attr_reader :date, :amount

  def initialize(date, amount)
    @date   = Date.parse(date)
    @amount = amount unless invalid? amount
  end

  def type
    amount >= 0 ? 'Credit' : 'Debit'
  end

  private

  def invalid?(amount)
    raise 'Invalid transaction amount' if amount.to_f.zero?
  end
end
