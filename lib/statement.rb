class Statement
  STATEMENT_HEAD = "date || credit || debit || balance"
  def initialize(account_instance)
    @account_instance = account_instance
  end

  def print_statement
    puts STATEMENT_HEAD
    @account_instance.transactions.reverse.map do |trans|
      puts "#{trans.date} || #{trans.credit} || #{trans.debit} || #{trans.current_balance}"
    end

  end
end
