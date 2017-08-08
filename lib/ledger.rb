class Ledger
  attr_accessor :transactions, :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def print_statement
    print_heading
    create_transaction_history
  end

  private

  def print_heading
    puts 'date || credit || debit || balance'
  end

  def create_transaction_history
    history = []
    sort_transactions.each do |transaction|
      history << if transaction[:type] == :debit
                   format_debit(transaction)
                 else
                   format_credit(transaction)
                 end
    end
    sort_transaction_history(history)
    @balance = 0
  end

  def sort_transactions
    @transactions.sort_by { |k, _v| k[:date] }
  end

  def format_debit(transaction)
    "#{transaction[:date]} || || #{format('%.2f', transaction[:amount])} || #{format('%.2f', @balance -= transaction[:amount])}\n"
  end

  def format_credit(transaction)
    "#{transaction[:date]} || #{format('%.2f', transaction[:amount])} || || #{format('%.2f', @balance += transaction[:amount])}\n"
  end

  def sort_transaction_history(transactions)
    puts transactions.reverse.join
  end
end
