class Bank

  attr_reader :statement

  def print_statement(account)
    @statement = "date || credit || debit || balance\n"
    history = account.history
    format_transaction(history)
  end

  private

  def format_transaction(history)
    history.each { |transaction| pretty_print(transaction) }
    @statement
  end

  def pretty_print(transaction)
    amount = transaction.amount
    amount > 0 ? credit = amount : debit = amount.abs
    @statement += "#{transaction.date} || #{credit} || #{debit} || #{transaction.balance}\n"
  end
end
