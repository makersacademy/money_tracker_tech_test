require 'date'

class Record
  attr_reader :date, :amount

  def initialize(date, amount)
    @date   = Date.parse(date)
    @amount = check_amount(amount)
  end

  private

  def check_amount(amount)
    raise 'Invalid transaction amount' if amount.to_f == 0
    amount.to_f
  end
end
