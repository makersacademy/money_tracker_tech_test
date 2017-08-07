class Ledger
  attr_accessor :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    puts "date || credit || debit || balance"
    balance = 0
    self.sort_transactions.each do |transaction|
      if transaction[:amount] < 0
        puts "#{transaction[:date]} || || #{transaction[:amount].abs} || #{balance - transaction[:amount]}\n"
      else
        puts "#{transaction[:date]} || #{transaction[:amount].abs} || || #{balance + transaction[:amount]}\n"
      end
    end
  end

  def sort_transactions
    @transactions.map.sort_by {|k,v| k[:date]}.reverse
  end

end
