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

  def create_row this_transaction
    calculate_balance this_transaction

    "#{this_transaction[:date].strftime('%d/%m/%Y')} " +
    "|| #{'%.2f' % this_transaction[:credit] if this_transaction[:credit]} " +
    "|| #{'%.2f' % this_transaction[:debit] if this_transaction[:debit]} " +
    "|| #{'%.2f' % @balance}"
  end

  def calculate_balance transaction
    @balance += transaction[:credit] || -(transaction[:debit])
  end
end
