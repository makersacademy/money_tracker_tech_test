class Transaction
  # is responsible for maintaining information about a transaction

attr_reader :date, :credit, :debit, :balance

  def initialize(date, credit, debit, balance)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def deposit?
    @credit > 0
  end

  def withdrawal?
    @debit > 0
  end

end
