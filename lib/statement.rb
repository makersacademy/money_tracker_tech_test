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
    @formatted_transactions.each do |transaction|
      if credit?(transaction)
        puts (transaction[:date]).to_s + ' || ' + (transaction[:amount]).to_s +
        ' ||   || ' + update_balance.to_s
      else
        puts (transaction[:date]).to_s + ' ||   || ' + transaction[:amount].abs.to_s +
        ' || ' + update_balance.to_s
      end
    end
  end

  def credit?(transaction)
    transaction[:type] == :credit ? true : false
  end

  def update_balance
    @formatted_transactions.map { |record| record[:amount] }.reduce(:+)
  end
end
