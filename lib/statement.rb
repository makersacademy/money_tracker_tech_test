class Statement
  attr_reader :ledger, :formatted_transactions, :balance

  def initialize(ledger)
    @ledger = ledger
    @formatted_transactions = []
  end

  def prepare_statement
    format_transaction_hash
    print_heading
    print_transactions
  end

  private

  def print_heading
    puts 'date || credit || debit || balance'
  end

  def format_transaction_hash
    @ledger.transactions.each do |record|
      @formatted_transactions.push(amount: record.amount, date: record.date, type: record.type)
    end
  end

  def print_transactions
    balance = 0
    @formatted_transactions.each do |transaction|
      balance += transaction[:amount]
      if credit?(transaction)
        puts "#{transaction[:date]} || #{format_money(transaction[:amount])} ||   || #{format_money(balance)}"
      else
        puts "#{transaction[:date]} ||   || #{format('%.2f', transaction[:amount].abs)} || #{format_money(balance)}"
      end
    end
  end

  def credit?(transaction)
    transaction[:type] == :credit ? true : false
  end

  def format_money(amount)
    format('%.2f', amount)
  end
end
