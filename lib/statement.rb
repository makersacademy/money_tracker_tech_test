require 'transaction_list'

class Statement

  def display_transactions
    produce_header
    produce_individual_transactions
  end

  private
  def initialize(transaction_list)
    @transaction_list = transaction_list
  end

  def produce_header
    puts "date || credit || debit || balance"
  end

  def produce_individual_transactions
    @transaction_list.list.reverse.each do |transaction|
      puts "#{formatted_date(transaction.date)}" + "||" + "#{transaction.getCredit}" + "||" + "#{transaction.getDebit}" + "||" + "#{transaction.balance}"
    end
  end

  def formatted_date(date)
    date.strftime("%m/%d/%Y")
  end

end
