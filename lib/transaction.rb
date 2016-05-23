class Transaction

  attr_reader :amount
  attr_reader :date

  def initialize(amount, date)
    @amount = amount
    @date = date
  end

end
