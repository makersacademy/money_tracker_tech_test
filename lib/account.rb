class Account
  require 'date'

  STATEMENT_HEADER = 'date || credit || debit || balance'

  def initialize
    @transactions = []
  end

  def transactions
    @transactions.dup
  end

  def deposit amount
    create_record credit: amount
  end

  def withdraw amount
    create_record debit: amount
  end

  def statement
    create_statement.join("\n")
  end

  private

  def date
    Date.today
  end

  def create_record(credit: nil, debit: nil)
    @transactions << ({ date: date, credit: credit, debit: debit })
  end

  def create_statement
    [STATEMENT_HEADER] + transaction_rows.reverse
  end

  def transaction_rows
    @balance = 0

    @transactions.map do |t|
      @balance += t[:credit] || -(t[:debit])
      "#{t[:date].strftime('%d/%m/%Y')} || #{t[:credit]} || #{t[:debit]} || #{@balance}"
    end
  end
end
