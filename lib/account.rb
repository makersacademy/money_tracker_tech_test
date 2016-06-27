require_relative './transaction'

class Account
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @transaction_history = []
  end

  def get_balance
    @balance
  end

  def deposit(value, date)
    @transaction_history.push(Transaction.new(value, date))
    @balance += value
  end

  def withdraw(value, date)
    @transaction_history.push(Transaction.new(-value, date))
    @balance -= value
  end

  def get_transaction_history
    @transaction_history.clone
  end

end
