class Account
  require 'date'

  STATEMENT_HEADER = 'date || credit || debit || balance'
  DEFAULT_BALANCE = 0

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
    [STATEMENT_HEADER] + statement_entries.reverse
  end

  def statement_entries
    @balance = DEFAULT_BALANCE

    @transactions.map do | transaction |
      create_row transaction
    end
  end

  def create_row transaction
    calculate_balance transaction
    
    "#{transaction[:date].strftime('%d/%m/%Y')} |" +
    "| #{transaction[:credit]} |" +
    "| #{transaction[:debit]} |" +
    "| #{@balance}"
  end

  def calculate_balance transaction
    @balance += transaction[:credit] || -(transaction[:debit])
  end
end
