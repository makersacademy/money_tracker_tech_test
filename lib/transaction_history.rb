class TransactionHistory
  def initialize
    @all_transactions = []
  end

  attr_reader :all_transactions

  def add_transaction(date, amount, balance)
    @all_transactions << { date: date, amount: amount, balance: balance }
  end
end
