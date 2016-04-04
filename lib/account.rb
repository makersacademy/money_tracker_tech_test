class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @transaction_log = []
  end

  def deposit(amount)
    raise 'Invalid amount' if amount < 0 || !amount.is_a?(Numeric)
    self.balance += amount
    log_transaction(:deposit, amount, self.balance)
  end

  def withdraw(amount)
    raise 'Invalid amount' if amount < 0 || !amount.is_a?(Numeric)
    raise 'Insufficient funds' if amount > self.balance
    self.balance -= amount
    log_transaction(:withdrawal, amount, self.balance)
  end

  def statement
    transaction_log
  end

  private

  attr_writer :balance
  attr_reader :transaction_log

  def log_transaction(type, amount, balance, date = Date.new)
    transaction = {
      type: type,
      amount: amount,
      balance: balance,
      date: date
    }
    transaction_log.push(transaction)
  end
end
