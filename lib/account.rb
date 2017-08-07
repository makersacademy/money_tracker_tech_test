
class Account

  INITIAL_BALANCE = 0

  attr_reader :transactions, :balance

  def initialize(statement, transactions)
    @transactions = transactions || Transactions.new
    @statement = statement || Statement
    @balance = INITIAL_BALANCE
  end

end
