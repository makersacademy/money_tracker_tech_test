class Statement
  def initialize(transactions_list)
    @transactions_list = transactions_list
  end

  def generate_statement
    create_header
  end

  private

  def create_header
    puts "date | debit | credit | balance"
  end

end
