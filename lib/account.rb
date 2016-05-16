class Account

  attr_reader :balance, :history

  def initialize(transaction_class: Transaction)
    @transaction_class = transaction_class
    @balance = 0
    @history = []
  end

  def withdraw(amount)
    update_balance(-amount)
    store_transaction_history(-amount, @balance)
  end

  def deposit(amount)
    update_balance(amount)
    store_transaction_history(amount, @balance)
  end

  private

  def update_balance(amount)
    @balance += amount
  end

  def store_transaction_history(amount, balance)
    @transaction = @transaction_class.new(amount, balance)
    @history << @transaction
  end
end
