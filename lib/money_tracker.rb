class MoneyTracker

  attr_reader :balance, :credits

  def initialize(balance = 0)
    @balance = balance
    @credits = []
  end

  def credit(amount, date)
    format_amount = ('%.2f' % amount).to_f
    @balance += format_amount
    @credits << { date => format_amount }
  end
end
