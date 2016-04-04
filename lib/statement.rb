class Statements

  attr_reader :collection

  def initialize
    @collection = [];
  end

  def create_statement(balance:, deposit: nil, withdraw: nil)
    params = binding.local_variables
    statement = params.map { |p| [p, eval(p.to_s)] }.to_h
    statement.store(:time, date_format)
    @collection << statement
  end

  def print
    lineWidth = 40
    puts "date || credit || debit || balance"
    @collection.each do |statement|
      puts "statement[:time] || statement[:deposit] || statement[:withdraw] || statement[:balance] "
    end
 end

  private

  def currency_format(amount)
    return "" if amount == nil
    '%.2f' % amount
  end

  def date_format
    Time.now.strftime('%D')
  end
end

