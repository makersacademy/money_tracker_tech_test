require 'date'

class Transaction

  attr_reader :date, :balance, :credit, :debit

  def initialize(balance, credit = nil, debit = nil)
    @date = formatted_date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  private

  def formatted_date
    Date.today.strftime("%m/%d/%Y")
  end
end
