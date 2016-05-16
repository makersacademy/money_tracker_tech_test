class Account

  attr_reader :balance, :history

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @balance = 0
    @history = []
  end

  def withdraw(amount)
    @transaction = @transaction_class.new(-amount)
    @balance -= amount
    @history << [@transaction, @balance]
  end

  def deposit(amount)
    @transaction = @transaction_class.new(amount)
    @balance += amount
    @history << [@transaction, @balance]
  end
end
