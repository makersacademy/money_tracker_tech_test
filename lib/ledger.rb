class Ledger
  attr_accessor :transactions

  def initialize
    @transactions = []
    @balance = 0
  end

  def print_statement
    print_heading
    create_transaction_history
  end

  # private

  def print_heading
    puts 'date || credit || debit || balance'
  end

  def create_transaction_history
    history = []
    sort_transactions.each do |transaction|
      if debit?(transaction)
        history << format_debit(transaction)
      else
        history << format_credit(transaction)
      end
    end
    sort_transaction_history(history)
  end

  def sort_transactions
    @transactions.sort_by { |k, v| k[:date] }
  end

  def debit?(transaction)
    transaction[:amount].to_i < 0
  end

  def format_debit(transaction)
    "#{transaction[:date]} || || #{transaction[:amount].abs} || #{@balance += transaction[:amount]}\n"
  end

  def format_credit(transaction)
    "#{transaction[:date]} || #{transaction[:amount]} || || #{@balance += transaction[:amount]}\n"
  end

  def sort_transaction_history(transactions)
    puts transactions.reverse.join
  end

end
