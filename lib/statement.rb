
class Statement
  def initialize(transactions_log)
    @transactions_log = transactions_log
  end

  def print_it
    print_header
    print_each_transaction
  end

  private

  attr_reader :transactions_log

  def print_header
    puts ' date | credit | debit | balance '
  end

  def print_(transaction)
    puts " #{transaction.time.strftime('/%d/%m/%y')} | #{transaction.credit} | #{transaction.debit} | #{transaction.balance}  "
  end

  def print_each_transaction
    transactions_log.history.reverse.each { |transaction| print_(transaction) }
  end
end
