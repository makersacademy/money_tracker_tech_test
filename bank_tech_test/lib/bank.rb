
class Bank
  attr_reader :account_balance, :account_statement

  def initialize
    @account_balance = 0
    @account_statement = []
  end

  def make_deposit(deposit)
    @account_balance = account_balance + deposit
    account_statement.push({:date => Time.now.strftime("%m/%d/%Y")}, {:credit => deposit}, {:balance => @account_balance})
  end

  def make_withdrawal(withdrawal)
    @account_balance = account_balance - withdrawal
    account_statement.push({:date => Time.now.strftime("%m/%d/%Y")}, {:debit => withdrawal}, {:balance => @account_balance})
  end
end
