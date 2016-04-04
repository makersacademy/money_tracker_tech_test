class Printer

  HEADER = "date || credit || debit || balance\n"

  def print_statement(statements)
    to_print = HEADER
    statements.reverse.each do |statement|
      to_print += "#{format_date(statement[:date])} ||" +
                "#{convert_value(statement[:credit])} ||" +
                "#{convert_value(statement[:debit])} ||" +
                "#{convert_value(statement[:balance])}\n"
    end
    to_print
  end

  private

  def convert_value(value)
    " #{sprintf('%.2f', value)}" if value != nil
  end

  def format_date(date)
    date.gsub!('-','/')
  end

end
