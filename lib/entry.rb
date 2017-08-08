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

  def get_balance
    @balance
  end

  def set_attributes(amount, balance)
    set_credit_or_debit(amount)
    set_balance(balance)
  end

  private

  def initialize
    @date = Date.today
    @credit = nil
    @debit = nil
    @balance = 0
  end

  def set_credit_or_debit(amount)
    amount > 0? @credit = amount : @debit = -amount
  end

  def set_balance(balance)
    @balance = balance
  end

end
