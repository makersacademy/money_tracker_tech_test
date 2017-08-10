class StatementFormatter

  def create_statement(transactions)
    current_balance = 0
    statement = create_header
    transactions.inject(create_header) do |statement, transaction|
      current_balance += transaction.amount
      statement += format_transaction(transaction, current_balance)
    end
  end

  private

  def format_transaction(transaction, balance)
    transaction.date + ' || ' + format_amount(transaction) + format_balance(balance)
  end

  def format_balance(balance)
    ('%.2f' % balance).to_s + "\n"
  end

  def create_header
    "date || earning || spending || balance\n"
  end

  def format_amount(transaction)
    transaction.amount > 0 ? format_earning(transaction) : format_spending(transaction)
  end

  def format_earning(transaction)
    ('%.2f' % transaction.amount).to_s + ' || || '
  end

  def format_spending(transaction)
    '|| ' + ('%.2f' % (transaction.amount * -1)).to_s + ' || '
  end
end
