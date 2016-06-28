require_relative './transaction'

class Account
  DEFAULT_BALANCE = 0

  def initialize(transaction_class = Transaction)
    @balance = DEFAULT_BALANCE
    @transaction_history = []
    @transaction_class = transaction_class
  end

  def balance
    @balance
  end

  def deposit(value, date)
    @transaction_history.push(@transaction_class.new(value, date))
    @balance += value
  end

  def withdraw(value, date)
    @transaction_history.push(@transaction_class.new(-value, date))
    @balance -= value
  end

  def transaction_history
    @transaction_history.clone
  end

end
