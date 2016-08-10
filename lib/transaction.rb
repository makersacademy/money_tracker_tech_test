class Transaction

attr_reader :date, :amountChange

  def initialize(date = Date.new, amountChange)
    @date = date
    @amountChange = amountChange
  end

end
