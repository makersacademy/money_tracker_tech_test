require './lib/transaction'


class History

  attr_reader :all, :transaction

  def initialize(transaction = Transaction)
    @all = []
    @transaction = transaction
  end

  def deposit(amount, date)
    @all << transaction.new(amount, date)
  end

  def withdraw(amount, date)
    @all << transaction.new(amount - (amount*2), date)
  end

end
