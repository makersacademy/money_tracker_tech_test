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

  FORMATS = {"deposits" => @deposit_history }

  def create_statement(format=nil)
    transactions = FORMATS[format] || history
    p transactions
    print_history = transactions.reverse.map { |transaction| transaction.date + " || " + credit_or_debit(transaction) + "|| "  + formatted_balance(transaction.end_balance) }
    print_history.unshift("date || credit || debit || balance")
  end

  def credit_or_debit(transaction)
    return formatted_balance(transaction.amount) + " || " if transaction.type == "deposit"
    return "|| " + formatted_balance(transaction.amount) + " " if transaction.type == "withdrawl"
  end

  def formatted_balance(balance)
    '%.2f' % balance
  end

  @deposit_history = Proc.new { history.select { |transaction| transaction.type == 'deposit'} }

  # def deposit_history
  #   history.select { |transaction| transaction.type == 'deposit'}
  # end

end
