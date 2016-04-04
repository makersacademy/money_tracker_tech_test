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
    print_history = history.reverse.map do | transaction|
      transaction.date + " || " + credit_or_debit(transaction) + "|| "  + ('%.2f' % transaction.end_balance)
    end
    print_history.unshift("date || credit || debit || balance")
  end

  def credit_or_debit(transaction)
    return ('%.2f' % transaction.amount) + " || " if transaction.type == "deposit"
    return "|| " + ('%.2f' % transaction.amount) + " " if transaction.type == "withdrawl"
  end

end
