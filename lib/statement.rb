class Statement
  attr_reader :ledger, :formatted_transactions, :balance

  def initialize(ledger)
    @ledger = ledger
    @formatted_transactions = []
    @balance ||= 0
  end

  def print_statement
    format_transactions
    print_heading
    print_transactions
  end

  private

  def print_heading
    puts 'date || credit || debit || balance'
  end

  def format_transactions
    @ledger.transactions.each do |record|
      @formatted_transactions.push(amount: record.amount, date: record.date, type: record.type)
    end
  end

  def print_transactions
    @formatted_transactions.each do |transaction|
      if transaction[:type] == :credit
        puts (transaction[:date]).to_s + ' || ' + (transaction[:amount]).to_s +
        ' ||   || ' + update_balance.to_s
      else
        puts (transaction[:date]).to_s + ' ||   || ' + transaction[:amount].abs.to_s +
        ' || ' + update_balance.to_s
      end
    end
  end

  def update_balance
    @balance = @formatted_transactions.map { |record| record[:amount] }.reduce(:+)
  end
end
