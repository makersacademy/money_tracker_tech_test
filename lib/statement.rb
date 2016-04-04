class Statement
  # is responsible for initiating / recording transactions

  def initialize(transaction_klass = Transaction)
    @transactions = []
    @transaction_klass = Transaction
  end

  def history
    @transactions.dup
  end

  def new_transaction(deposit, withdrawal, date)
    record_transaction(@transaction_klass.new(date, deposit, withdrawal))
  end

  def print(balance)
    printout = ["date || credit || debit || balance"]
    # need more reliable method for getting to/from current balance?
    history.reverse.each do |t|
      printout << "#{date_formatted(t.date)} || #{dp2(t.credit)} || #{dp2(t.debit)} || #{dp2(balance)}"
      balance = balance - t.credit + t.debit
    end
    printout.join("\n")
  end

  private

  def record_transaction(transaction)
    @transactions << transaction
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
