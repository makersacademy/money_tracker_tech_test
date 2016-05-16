class Statement

  attr_reader :header, :body

  def initialize
    @header = "date || credit || debit || balance\n"
    @body = ''
  end

  def format_transaction(history)
    history.each { |transaction| pretty_print(transaction) }
    @header + @body
  end

  private

  def pretty_print(transaction)
    amount = transaction.amount
    amount > 0 ? credit = amount : debit = amount.abs
    @body += "#{transaction.date} || #{credit} || #{debit} || #{transaction.balance}\n"
  end

end
