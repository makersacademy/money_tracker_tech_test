
# Understands how to print transaction history

class Statement
  def initialize(transaction_log: TransactionLog.instance)
    @transaction_log = transaction_log
  end

  def print_it
    print_header
    print_each_transaction
  end

  private

  attr_reader :transaction_log

  def print_header
    puts ' date | credit | debit | balance '
  end

  def print_(transaction, balance)
    puts " #{transaction.time.strftime('%d/%m/%y')} | #{transaction.credit} | #{transaction.debit} | #{balance} "
  end

  def print_each_transaction
    transaction_log.transactions.reverse.each_with_index do |transaction, index|
      balance = transaction_log.balances.reverse[index]
      print_(transaction, balance)
    end
  end
end
