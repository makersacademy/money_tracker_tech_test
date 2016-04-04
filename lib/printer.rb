require_relative 'statement'

class Printer

  def print_records(statement)
    puts "date || credit || debit || balance"
    statement.credits.each {|date, amount, balance| puts "#{date} || #{amount} || || #{balance}"}
    statement.debits.each {|date, amount, balance| puts "#{date} || || #{amount} || #{balance}"}
  end

end
