class TransactionLog

  attr_reader :transactions, :total

  def initialize
    @transactions = []
  end

  def add_new(transaction)
    @transactions << transaction
    calculate_total
  end

  def print_statement
    @statement_total = @transactions.inject(0) { |result, transaction| result + transaction.total }
    print "date || credit || debit || balance"
    @transactions.each do |transaction|
      print "\n#{transaction.date.strftime("%d/%m/%Y")} ||"
      print "#{' ' + '%.2f' % transaction.total_credit if transaction.total_credit > 0} ||"
      print "#{' ' + '%.2f' % transaction.total_debit if transaction.total_debit > 0} || "
      print "#{'%.2f' % @statement_total}"
      @statement_total -= transaction.total
    end
  end

  private

    def calculate_total
      @total = 0
      @transactions.each do |transaction|
        @total += transaction.total
      end
    end

end
