class Statement
  # is responsible for initiating / recording transactions

  def initialize(transaction_klass = Transaction)
    @transactions = []
    @transaction_klass = Transaction
  end

  def history
    @transactions.dup
  end

  def new_transaction(deposit, withdrawal, date, balance)
    record_transaction(@transaction_klass.new(date, deposit, withdrawal, balance))
  end

  def print(filter = 'none')
    printout = ["date || credit || debit || balance"]
    filtered_transactions(filter).reverse.each do |t|
      printout << "#{date_formatted(t.date)} || #{dp2(t.credit)} || #{dp2(t.debit)} || #{dp2(t.balance)}"
    end
    printout.join("\n")
  end

  private

  def record_transaction(transaction)
    @transactions << transaction
  end

  def filtered_transactions(filter)
    if filter == 'deposit'
      history.select{|t| t.deposit?}
    elsif filter == 'withdrawal'
      history.select{|t| t.withdrawal?}
    elsif filter == 'ascending'
      history.sort { |x,y| y.date <=> x.date }
    elsif filter == 'descending'
      history.sort { |x,y| x.date <=> y.date }
    else
      history
    end
  end

  def date_formatted(date)
    year = date.year > 9 ? "#{date.year}" : "0#{date.year}"
    month = date.month > 9 ? "#{date.month}" : "0#{date.month}"
    day = date.day > 9 ? "#{date.day}" : "0#{date.day}"
    "#{day}/#{month}/#{year}"
  end

  def dp2(num)
    sprintf("%.2f", num)
  end

end
