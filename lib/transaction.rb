class Transaction
  attr_reader :amount, :date, :balance, :debit

  def initialize(amount = 0, balance = 0, debit = 0)
    @amount = amount
    @date = Time.new.strftime("%d/%m/%Y")
    @balance = balance
    @debit = debit
  end
end
