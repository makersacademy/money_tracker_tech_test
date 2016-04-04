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

  def print
    printout = ["date || credit || debit || balance"]
    sum = 0
    @transactions.each do |t|
      sum = sum + t.credit - t.debit
      printout.insert(1, "#{date_formatted(t.date)} || #{dp2(t.credit)} || #{dp2(t.debit)} || #{dp2(sum)}" )
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
