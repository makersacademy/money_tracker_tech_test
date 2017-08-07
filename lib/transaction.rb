require 'date'

class Transaction

  attr_reader :date, :balance, :amount, :credit, :debit

  def initialize(balance, amount, credit = false, debit = false)
    @date = Date.today
    @credit = credit
    @debit = debit
    @balance = balance
    @amount = amount
  end

end
