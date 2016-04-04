class Account
  attr_reader :balance, :account_statement

  def initialize
    @balance = 0
    @account_statement = []
  end

  def withdraw_funds(amount)
    @balance -= amount
    calculate_statement(amount)
  end

  def deposit_funds(amount)
    @balance += amount
    calculate_statement(amount)
  end

  def calculate_statement(amount)
    statement = {}
    statement[:date] = time
    statement[:transaction] = amount
    statement[:balance] = @balance
    account_statement.push(statement)
  end

  def time
    Time.now.strftime("%m/%d/%Y")
  end
end
