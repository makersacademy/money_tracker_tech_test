class Transaction
  attr_reader :amount
  attr_reader :date
  
  def initialize(amount = 0)
    @amount = amount
    @date = Time.new.strftime("%d/%m/%Y")
  end
end
