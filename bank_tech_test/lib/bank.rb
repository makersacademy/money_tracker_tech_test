
class Bank
  attr_reader :account_balance

  def initialize
    @account_balance = 0
  end

  def deposit(deposit)
    account_balance += deposit = @account_balance
  end
end
