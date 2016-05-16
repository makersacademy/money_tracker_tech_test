class Deposit

  attr_reader :amount

  def initialize(amount)
    @amount = amount
    @timestamp = Time.now
  end

  def date
    @timestamp.strftime("%d/%m/%Y")
  end


end