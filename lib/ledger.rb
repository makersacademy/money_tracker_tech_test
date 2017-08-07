class Ledger
  attr_accessor :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    self.sort_transactions
  #   balance = 0
  #   puts "date || credit || debit || balance"
  #   @transactions.each do |transaction|
  #     if transaction[:amount] < 0
  #       return "#{transaction[:date]} || || #{transaction[:amount].abs} || #{balance - transaction[:amount]}\n"
  #     else
  #       return "#{transaction[:date]} || #{transaction[:amount].abs} || || #{balance + transaction[:amount]}\n"
  #     end
  #   end
  end

  def sort_transactions
    @transactions.map.sort_by {|k,v| k[:date]}.reverse
  end

end
