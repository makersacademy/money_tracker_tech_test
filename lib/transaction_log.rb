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
    '%.2f' % balance
  end

  def print_statement(balance=0)
    statement = ""
    @transactions.each do |transaction|
      balance = '%.2f' % (balance.to_i + transaction.calculate_change.to_i)
      statement = "\n#{transaction.date.strftime("%Y/%m/%d")} || #{transaction.credit} || #{transaction.debit} || #{balance}" + statement
    end
    fix_look(statement)
  end

  private

  def fix_look(statement)
    statement = STATEMENT_HEADER + statement
    statement.gsub!(" 0.00 ", " ")
    statement
  end

end
