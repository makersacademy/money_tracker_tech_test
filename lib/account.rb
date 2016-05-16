class Account

  attr_reader :balance, :history

  def initialize(transaction_class: Transaction)
    @transaction_class = transaction_class
    @balance = 0
    @history = []
  end

  def withdraw(amount)
    @transaction = @transaction_class.new(-amount)
    update_balance(-amount)
    store_transaction_history
  end

  def deposit(amount)
    @transaction = @transaction_class.new(amount)
    update_balance(amount)
    store_transaction_history
  end

  private

  def update_balance(amount)
    @balance += amount
  end

  def store_transaction_history
    @history << {transaction: @transaction, balance: @balance}
  end
end
