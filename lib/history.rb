require './lib/transaction'


class History

  attr_reader :all, :transaction

  def initialize(transaction = Transaction)
    @all = []
    @transaction = transaction
  end

  def deposit(amount, date)
    all << transaction.new(amount, date)
  end

  # def deposit(transaction)
  #   @all << transaction
  # end


end
