class Bank

  def print_statement(account)
    history = account.history
    format_transaction(history)
  end

  private

  def format_transaction(history)
    statement = "date || credit || debit || balance\n"
    history.each do |transaction|
      amount = transaction.amount
      amount > 0 ? credit = amount : debit = amount.abs
      statement += "#{transaction.date} || #{credit} || #{debit} || #{transaction.balance}\n"
    end
    statement
  end
end
