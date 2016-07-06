require 'statement'

class Account
  attr_reader :balance, :statement

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    log_transaction(amount)
  end

  def withdrawal(amount)
      fail 'You do not have enough funds' if amount > @balance
      @balance -= amount
      log_transaction(amount)
  end

  private

  def log_transaction(amount)
    @statement.statement.push({date: Time.now.strftime("%d/%m/%Y"), amount: amount, balance: @balance})
  end


end
