class Transaction
  attr_reader :details

  def initialize
    @details = { date: nil, amount: 0, balance: 0 }
  end

  def value(date, amount)
    @details[:date] = date
    @details[:amount] = amount
    @details[:balance] = amount
  end

end
