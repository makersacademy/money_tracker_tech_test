
class Statement

  def initialize(transactions_log)
    @transactions_log = transactions_log
  end

  def print_it
    chronify_transactions
    print_header
    print_each_transaction
  end

  private

  attr_reader :transactions_log

  def chronify_transactions
    transactions_log.reverse!
  end

  def print_header
    puts " date | credit | debit | balance "
  end

  def print_(transaction)
    puts " #{transaction.time} |  #{transaction.credit} |  #{transaction.debit} |  #{transaction.balance}  "
  end

  def print_each_transaction
   transactions_log.history.each { |transaction| print_(transaction) }
  end

end
