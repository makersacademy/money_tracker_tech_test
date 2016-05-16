class TransactionLog

  attr_reader :transactions
  STATEMENT_HEADER = "date || credit || debit || balance"

  def initialize
    @transactions = []
  end

  def log(transaction)
    @transactions << transaction
  end

  def calculate_balance(starting_balance=0)
    balance = starting_balance
    @transactions.each do |transaction|
      balance += transaction.calculate_change.to_i
    end
    return '%.2f' % balance
  end

  def print_statement(starting_balance=0)
    statement = STATEMENT_HEADER
    balance = starting_balance
    @transactions.each do |transaction|
      balance = '%.2f' % (balance.to_i + transaction.calculate_change.to_i)
      statement += "\n#{transaction.date.strftime("%Y/%m/%d/")} || #{transaction.credit} || #{transaction.debit} || #{balance}"
    end
    return fix_spacing(statement)
  end

  private

  def fix_spacing(statement)
    statement.gsub!("  ", " ")
  end

end
