require './lib/transaction'


class History

  attr_reader :transactions, :transaction

  def initialize(transaction = Transaction)
    @transactions = []
    @transaction = transaction
  end

  def deposit(amount, date)
    @transactions << transaction.new(amount, date)
  end

  def withdraw(amount, date)
    @transactions << transaction.new(amount - (amount*2), date)
  end

end
