require './lib/transaction'


class History

  attr_reader :transactions, :transaction

  def initialize(transaction = Transaction)
    @transactions = []
    @transaction  = transaction
  end

  def deposit(amount, date)
    @transactions << transaction.new(amount, date)
  end

  def withdraw(amount, date)
    negative_amount = amount - (amount*2)
    @transactions << transaction.new(negative_amount, date)
  end

end
