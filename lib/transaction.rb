require 'date'

class Transaction

  attr_reader :date, :balance, :credit, :debit

  def get_credit
    @credit
  end

  def get_debit
    @debit
  end

  def get_date
    @date
  end

  private

  def initialize(balance, credit = nil, debit = nil)
    @date = Date.today
    @credit = credit
    @debit = debit
    @balance = balance
  end

end
