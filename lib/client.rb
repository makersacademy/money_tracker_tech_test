class Client

  attr_reader :account

  def initialize(account=Account)
    @account = account.new
  end

  def deposit(amount)
    process_transaction(amount, :credit)
  end

  def withdraw(amount)
    process_transaction(amount, :debit)
  end

  def show_statement
    account.compile_statement
  end

private

  def process_transaction(amount, type)
    account.new_action(amount, type)
  end




end
