class Printer

  HEADER = "date || credit || debit || balance\n"

  def print_statement(statements, filter_type)
    to_print = HEADER
    filter_order(statements, filter_type).each do |statement|
      next if ((filter_type == :credit || filter_type == :debit) && !(statement[filter_type]))
      to_print += "#{format_date(statement[:date])} ||" +
                  # "#{filter_transaction_type(statement, filter_type)}" +
                  "#{convert_value(statement[:credit])} ||" +
                  "#{convert_value(statement[:debit])} ||" +
                  "#{convert_value(statement[:balance])}\n"
    end
    to_print
  end

  private

  def filter_transaction_type(statement, type)
    if(type = :credit)
      "#{convert_value(statement[:credit])} || ||"
    elsif(type = :debit)
      " ||#{convert_value(statement[:debit])} ||"
    else
      "#{convert_value(statement[:credit])} ||" +
      "#{convert_value(statement[:debit])} ||"
    end
  end

  def filter_order(statements, order)
    order == :ascending ? statements : statements.reverse
  end

  def convert_value(value)
    " #{sprintf('%.2f', value)}" if value != nil
  end

  def format_date(date)
    date.gsub!('-','/')
  end

end
