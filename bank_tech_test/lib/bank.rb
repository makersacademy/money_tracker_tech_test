
class Bank
  attr_reader :account_balance

  def initialize
    @account_balance = 0
  end

  def make_deposit(deposit)
    @account_balance = account_balance + deposit
  end

  def make_withdrawal(withdrawal)

  end
end
