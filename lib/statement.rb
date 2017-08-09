class Statement

  attr_reader :transactions_list

  def initialize(transactions_list)
    @transactions_list = transactions_list
  end

  def generate_statement
    create_header
    display_records(transactions_list)
  end

  private

  def create_header
    puts "date | debit | credit | balance"
  end

  def display_records(arr)
    arr.each_with_index { |t, i| puts "#{t.date} | #{t.debit} | #{t.credit} | #{calculate_balance(arr, i)}" }
  end

  def calculate_balance(arr, i)
    arr[0..i].inject(0) { |sum, t| sum + t.credit - t.debit }
  end

end
