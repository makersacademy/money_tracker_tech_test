class BankAccount

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def current_balance
    balance
  end

  def deposit(transaction_instance)
    add_transaction(transaction_instance)
    @balance += transaction_instance.amount
  end

  def withdraw(transaction_instance)
    add_transaction(transaction_instance)
    @balance -= transaction_instance.amount
  end

  private

  def add_transaction(transaction_instance)
    @transactions << transaction_instance
  end

end
