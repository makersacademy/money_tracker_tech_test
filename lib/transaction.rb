class Transaction
  attr_reader :date, :amount, :details

  def initialize
    @details = { date: date, amount: amount }
  end

  def value(date, amount)
    @details[:amount] = amount
    @details[:date] = date
  end

end
