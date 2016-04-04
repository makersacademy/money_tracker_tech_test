class Transaction
  # is responsible for maintaining information about a transaction

attr_reader :date, :credit, :debit

  def initialize(date, credit, debit)
    @date = date
    @credit = credit
    @debit = debit
  end

end
