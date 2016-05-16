class Transaction

  attr_reader :date, :amount, :account

  def initialize(amount)
    @date = Time.now.strftime("%d/%m/%Y")
    @amount = amount
  end

end
