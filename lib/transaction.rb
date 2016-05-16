class Transaction

  attr_reader :date, :amount, :account

  def initialize(amount, account)
    @date = Time.now.strftime("%d/%m/%Y")
    @amount = amount
    @account = account
  end

end
