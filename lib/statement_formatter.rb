class StatementFormatter

  def format_transaction(transaction)
    transaction.date + ' || ' + format_amount(transaction)
  end

  private
  
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
