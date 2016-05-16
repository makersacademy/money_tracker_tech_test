class Transaction

  attr_reader :date, :credit, :debit

  def initialize(date, credit=0, debit=0)
    @date = date
    @credit = credit
    @debit = debit
  end

end
