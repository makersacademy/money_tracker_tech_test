class Client

  attr_reader :account

  def initialize(account=Account)
    @account = account.new
  end

  def deposit(amount)
    process_transaction(amount, :deposit)
  end

  def withdraw(amount)
    process_transaction(amount, :withdrawal)
  end

private

  def process_transaction(amount, type)
    account.new_action(amount, type, self)
  end

end
