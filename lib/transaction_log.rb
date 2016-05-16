class TransactionLog

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def log(transaction)
    @transactions << transaction
  end

  def calculate_balance(starting_balance=0)
    balance = starting_balance
    @transactions.each do |transaction|
      balance += transaction.calculate_change
    end
    return balance
  end
  
end
