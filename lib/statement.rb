require_relative 'record_list'

class Statement

  def initialize(record_list)
    @list = record_list.get_list
    collate_statement
  end

  def display_transactions
    collate_statement
  end

  private

  def collate_statement
    produce_header
    produce_individual_transactions
  end

  def produce_header
    puts "date || credit || debit"
  end

  def produce_individual_transactions
    @list.reverse.each do |record|
      puts "#{formatted_date(record.get_date)}" + "||" + "#{record.get_credit}" + "||" + "#{record.get_debit}"
    end
  end

  def formatted_date(date)
    date.strftime("%m/%d/%Y")
  end

end
