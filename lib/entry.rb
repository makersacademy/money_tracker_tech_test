require 'date'

class Entry

  attr_reader :date, :credit, :debit

  def initialize(amount, date)
    @date = Date.parse(date)
    @credit = nil
    @debit = nil
    set_credit_or_debit(amount)
  end

  private

  def set_credit_or_debit(amount)
    amount > 0? @credit = amount : @debit = -amount
  end

end
