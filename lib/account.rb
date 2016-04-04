require 'date'

class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @transaction_log = []
  end

  def deposit(amount)
    raise 'Invalid amount' if !amount.is_a?(Numeric) || amount < 0
    self.balance += amount
    log_transaction(:credit, amount, self.balance)
  end

  def withdraw(amount)
    raise 'Invalid amount' if !amount.is_a?(Numeric) || amount < 0
    raise 'Insufficient funds' if amount > self.balance
    self.balance -= amount
    log_transaction(:debit, amount, self.balance)
  end

  def statement
    transaction_log
  end

  private

  attr_writer :balance
  attr_reader :transaction_log

  def log_transaction(type, amount, balance, date = Date.today)
    transaction = {
      type: type,
      amount: amount,
      balance: balance,
      date: date
    }
    transaction_log.push(transaction)
  end
end
