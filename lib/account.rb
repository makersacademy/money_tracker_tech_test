class Account

  attr_reader :balance, :transactions, :transaction_class, :credit_transaction

  def initialize(transaction_class)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
  end

  def credit(amount, date)
    @credit_transaction = @transaction_class.new(amount, date)
  end

  def debit(amount, date)
    @credit_transaction = @transaction_class.new(amount, date)
  end

end
