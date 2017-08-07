class MoneyTracker

  attr_reader :balance, :credits, :debits

  def initialize(balance = 0)
    @balance = balance
    @credits = []
    @debits = []
  end

  def credit(amount, date)
    format_amount = ('%.2f' % amount).to_f
    @balance += format_amount
    @credits << { date => format_amount }
  end

  def debit(amount, date)
    format_amount = ('%.2f' % amount).to_f
    @balance -= amount
    @debits << { date => format_amount }
  end
end
