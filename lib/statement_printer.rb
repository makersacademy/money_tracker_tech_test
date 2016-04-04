require "pry"

class StatementPrinter
  def initialize
  end

  def print_out(transaction_log)
    format_row = "%10s || %10s || %10s || %10s"
    puts format_row % ['date', 'credit', 'debit', 'balance']

    transaction_log.each do |transaction|
      output_arr = []
      output_arr << transaction[:date].strftime("%d/%m/%Y")
      output_arr << "" if transaction[:type] == :debit
      output_arr << sprintf("%#.2f", transaction[:amount])
      output_arr << "" if transaction[:type] == :credit
      output_arr << sprintf("%#.2f", transaction[:balance])

      puts format_row % output_arr
    end
  end
end
