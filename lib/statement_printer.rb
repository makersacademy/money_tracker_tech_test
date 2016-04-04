class StatementPrinter

  attr_reader :history


  def initialize(history)
    @history = history
  end

  def print_statement(format=nil)
    format ? statement = create_statement(format) : statement = create_statement
    statement.each { |line| puts line }
  end

  private

  def create_statement(format=nil)
    transactions = history unless format
    transactions = deposit_history if format == 'deposits'
    transactions_to_print = format_transactions(transactions)
    transactions_to_print.unshift("date || credit || debit || balance")
  end

  def credit_or_debit(transaction)
    return formatted_balance(transaction.amount) + " || " if transaction.type == :deposit
    return "|| " + formatted_balance(transaction.amount) + " " if transaction.type == :withdrawl
  end

  def formatted_balance(balance)
    '%.2f' % balance
  end

  def format_transactions(transactions)
    transactions.reverse.map { |transaction| transaction.date + " || " + credit_or_debit(transaction) + "|| "  + formatted_balance(transaction.end_balance) }
  end

  # @deposit_history = Proc.new { history.select { |transaction| transaction.type == :deposit } }

  def deposit_history
    history.select { |transaction| transaction.type == :deposit }
  end

end
