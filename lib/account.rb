class Account

  attr_reader :balance, :transactions, :transaction_class

  def initialize(transaction_class)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
  end

  def credit(amount)
  end


end
