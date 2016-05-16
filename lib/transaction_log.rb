class TransactionLog
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def log(transaction)
    @transactions << transaction
  end

  def calculate_balance(balance=0)
    @transactions.each do |transaction|
      balance += transaction.calculate_change.to_i
    end
    two_sf(balance)
  end

  private

  def two_sf(balance)
    '%.2f' % balance
  end
end
