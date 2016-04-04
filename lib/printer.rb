class Printer

  HEADER = "date || credit || debit || balance\n"

  def print_statement(statements, filter_type)
    output = HEADER
    put_in_order(statements, filter_type).each do |statement|
      next if (is_credit_debit_filter(filter_type) && !(statement[filter_type]))
      output += make_output(statement)
    end
    output
  end

  private

  def make_output(statement)
    "#{format_date(statement[:date])} ||" +
    "#{convert_value(statement[:credit])} ||" +
    "#{convert_value(statement[:debit])} ||" +
    "#{convert_value(statement[:balance])}\n"
  end

  def is_credit_debit_filter(filter_type)
    filter_type == :credit || filter_type == :debit
  end


  def put_in_order(statements, order)
    order == :ascending ? statements : statements.reverse
  end

  def convert_value(value)
    " #{sprintf('%.2f', value)}" if value != nil
  end

  def format_date(date)
    date.gsub!('-','/')
  end

end
