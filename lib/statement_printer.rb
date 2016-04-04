class StatementPrinter

  attr_reader :history

  def initialize(history)
    @history = history
  end

  def print_statement
    statement = create_statement
    statement.each { |line| puts line }
  end

  private

  def create_statement
    print_history = history.reverse.map { |transaction| transaction.date + " || " + credit_or_debit(transaction) + "|| "  + formatted_balance(transaction.end_balance) }
    print_history.unshift("date || credit || debit || balance")
  end

  def credit_or_debit(transaction)
    return formatted_balance(transaction.amount) + " || " if transaction.type == "deposit"
    return "|| " + formatted_balance(transaction.amount) + " " if transaction.type == "withdrawl"
  end

  def formatted_balance(balance)
    '%.2f' % balance
  end

end
