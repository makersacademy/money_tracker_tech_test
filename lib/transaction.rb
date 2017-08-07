require 'date'

class Transaction

  attr_reader :date, :balance, :credit, :debit

  def initialize(balance, credit = nil, debit = nil)
    @date = Date.today
    @credit = credit
    @debit = debit
    @balance = balance
  end

end
