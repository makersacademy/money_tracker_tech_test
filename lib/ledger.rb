class Ledger
  attr_accessor :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    print_heading
    print_transactions
  end

  private

  def print_heading
    puts "date || credit || debit || balance"
  end

  def print_transactions
    sort_transactions.each do |transaction|
      balance = 0
      if transaction[:amount] < 0
        puts "#{transaction[:date]} || || #{transaction[:amount].abs} || #{balance - transaction[:amount]}"
      else
        puts "#{transaction[:date]} || #{transaction[:amount].abs} || || #{balance + transaction[:amount]}"
      end
    end
  end

  def sort_transactions
    @transactions.map.sort_by {|k,v| k[:date]}.reverse
  end
end
