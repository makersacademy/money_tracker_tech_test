class Statement
  attr_reader :account
  STATEMENT_HEADER = "date || credit || debit || balance"

  def initialize(account)
    @account = account
  end

  def view_statement(start_balance:balance=0, filter:filter=:none, ascending: ascending=false)
    statement = ""
    account.transactions.each do |transaction|
      balance = update_balance(balance, transaction)
      statement = update_statement(statement, transaction, balance, ascending) if chosen?(transaction, filter)
    end
    fix_look(statement)
  end

  private

  def chosen?(transaction, filter)
    return true if filter == :none
    return true if transaction.deposit_or_withdrawal? == filter
    false
  end

  def fix_look(statement)
    statement = STATEMENT_HEADER + statement
    statement.gsub!(" 0.00 ", " ")
    statement
  end

  def update_balance(balance, transaction)
    balance + transaction.calculate_change
  end

  def update_statement(statement, transaction, balance, ascending)
    return statement + format_information(transaction, balance) if ascending
    format_information(transaction, balance) + statement
  end

  def format_information(transaction, balance)
    "\n#{transaction.date.strftime("%Y/%m/%d")} || #{two_sf(transaction.credit)} || #{two_sf(transaction.debit)} || #{two_sf(balance)}"
  end

  def two_sf(amount)
    '%.2f' % amount
  end
end
