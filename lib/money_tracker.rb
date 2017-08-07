require 'date'

class MoneyTracker

  attr_reader :balance, :credits, :debits

  def initialize(balance = 0)
    @balance = balance
    @credits = []
    @debits = []
  end

  def credit(amount)
    @balance += amount
    @credits << { format_date => amount }
  end

  def debit(amount)
    @balance -= amount
    @debits << { format_date => amount }
  end

private

  def format_date
    Date.today.strftime("%m/%d/%Y")
  end
end
