class TransactionHistory
  def initialize
    @all_transactions = []
  end

  attr_reader :all_transactions

  def add_transaction(transaction)
    @all_transactions << transaction
  end

  def print_statement
    puts 'date || credit || debit || balance'
    process_transactions
  end

  private

  def process_transactions
    @all_transactions.each do |transaction|
      "#{transaction.pretty_date} || #{credit_and_debit(transaction)} ||"\
      "#{transaction.balance}"
    end
  end

  def credit_and_debit(transaction)
    if transaction.amount > 0
      "#{transaction.amount} || "
    else
      "|| #{transaction.amount}"
    end
  end
end
