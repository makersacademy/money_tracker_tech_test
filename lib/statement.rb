
class Statement

  def initialize(transactions)
    @transactions = transactions.log
  end

  def print_it
    chronify_transactions
    print_header
    print_each_transaction
  end

  private

  attr_reader :transactions

  def chronify_transactions
    transactions.reverse!
  end

  def print_header
    puts " date | credit | debit | balance "
  end

  def print_(transaction)
    puts " #{transaction.timestamp} |  #{transaction.credit} |  #{transaction.debit} |  #{transaction.balance}  "
  end

  def print_each_transaction
   transactions.each { |transaction| print_(transaction) }
  end

end
