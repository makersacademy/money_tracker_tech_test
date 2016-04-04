class Client

  attr_reader :account_klass, :statement

  def initialize(account_klass = Account.new)
    @account_klass = account_klass
    @statement = nil
  end

  def make_deposit(amount)
    @account_klass.accept_deposit(amount)
  end

  def make_withdrawal(amount)
    @account_klass.accept_withdrawal(amount)
  end

  def print_statement
    @statement = @account_klass.previous_transactions
  end

end
