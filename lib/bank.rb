class Bank

  attr_reader :statement

  def initialize
    @statement = "date || credit || debit || balance\n"
  end

  def print_statement(account)
    history = account.history
    format_transaction(history)
  end

  private

  def format_transaction(history)
    history.each do |transaction|
      assign_credit_or_debit(transaction.amount)
      @statement += "#{transaction.date} || #{@credit} || #{@debit} || #{transaction.balance}\n"
    end
    @statement
  end

  def assign_credit_or_debit(amount)
    amount > 0 ? @credit = amount : @debit = amount.abs
  end

end
