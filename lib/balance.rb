class Balance

  STARTBALANCE = 0

  attr_reader :amount

  def initialize
    @amount = STARTBALANCE
  end

  def update(amount)
    @amount += amount
  end
end