class Transaction
  attr_reader :date

  def initialize(amount)
    @date = Date.new
  end

end
