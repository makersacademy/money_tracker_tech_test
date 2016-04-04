require_relative 'statement'

class Printer

  def print_records(statement)
    statement.credits.each {| date, amount | puts "#{date}: #{amount}" }
    statement.debits.each {| date, amount | puts "#{date}: #{amount}" }
  end

end
