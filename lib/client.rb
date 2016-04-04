class Client

  attr_reader :account

  def initialize(account=Account)
    @account = account.new
  end

  def deposit(amount, transaction=Transaction)
    transaction.new(amount, self, :deposit)
  end

  def withdraw(amount, transaction=Transaction)
    #YAGNI - might need to check if their is enough balance
    transaction.new(amount, self, :withdrawal)
  end

end
