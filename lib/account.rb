class Account
  attr_reader :transactions
  STARTING_BALANCE = 0

  def initialize
    @transactions = []
  end

  def log(transaction)
    @transactions << transaction
  end

  def calculate_balance(balance=STARTING_BALANCE)
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
