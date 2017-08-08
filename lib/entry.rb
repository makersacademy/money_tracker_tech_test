require 'date'

class Entry

  attr_reader :date, :credit, :debit, :balance

  def get_credit
    @credit
  end

  def get_debit
    @debit
  end

  def get_date
    @date
  end

  def set_attributes(amount)
    set_credit_or_debit(amount)
  end

  private

  def initialize
    @date = Date.today
    @credit = nil
    @debit = nil
  end

  def set_credit_or_debit(amount)
    amount > 0? @credit = amount : @debit = -amount
  end

end
