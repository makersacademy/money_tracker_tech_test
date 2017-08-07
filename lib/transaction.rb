require 'date'

class Transaction

  attr_reader :date, :balance, :credit, :debit

  def getCredit
    @credit
  end

  def getDebit
    @debit
  end

  def getDate
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
