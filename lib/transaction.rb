class Transaction
  attr_reader :details

  def initialize
    @details = { date: nil, amount: nil }
  end

  def value(date, amount)
    @details[:date] = date
    @details[:amount] = amount
  end

end
