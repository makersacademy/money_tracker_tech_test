require_relative 'transaction_list'

class Statement

  def display_transactions
    collate_statement
  end

  private

  def initialize(list)
    @transaction_list = list.get_list
  end

  def collate_statement
    produce_header
    produce_individual_transactions
  end

  def produce_header
    puts "date || credit || debit || balance"
  end

  def produce_individual_transactions
    @transaction_list.reverse.each do |transaction|
      puts "#{formatted_date(transaction.get_date)}" + "||" + "#{transaction.get_credit}" + "||" + "#{transaction.get_debit}" + "||" + "#{transaction.get_balance}"
    end
  end

  def formatted_date(date)
    date.strftime("%m/%d/%Y")
  end

end
