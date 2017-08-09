require_relative 'record_list'

class Statement

  attr_reader :list, :balance_list

  def initialize(record_list)
    @list = record_list.list
    @balance_list = []
  end

  def display_collated_statement
    amounts_to_running_balance
    produce_header
    produce_individual_transactions
  end

  private

  def produce_header
    puts "date || credit || debit || balance"
  end

  def produce_individual_transactions
    @list.reverse.each_with_index do |record, index|
      puts " #{formatted_date(record.date)} " + "||" +
           " #{record.credit} " + "||" +
           " #{record.debit} " + "||" +
           " #{@balance_list[index]} "
    end
  end

  def formatted_date(date)
    date.strftime("%m/%d/%Y")
  end

  def amounts_to_running_balance
    get_amounts
    sum = 0
    @balance_list = @balance_list.map{|x| sum += x}.reverse
  end

  def get_amounts
    @list.each do |entry|
      credit?(entry) ? @balance_list << entry.credit : @balance_list << entry.debit*-1
    end
  end

  def credit?(entry)
    entry.credit != nil
  end
end
