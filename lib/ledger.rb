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
    balance = 0
    transaction_output = []
    sort_transactions.each do |transaction|
      if transaction[:amount] < 0
        transaction_output << "#{transaction[:date]} || || #{transaction[:amount].abs} || #{balance += transaction[:amount]}\n"
      else
        transaction_output << "#{transaction[:date]} || #{transaction[:amount]} || || #{balance += transaction[:amount]}\n"
      end
    end

    puts transaction_output.reverse.join
  end

  def sort_transactions
    @transactions.sort_by {|k,v| k[:date]}
  end
end
