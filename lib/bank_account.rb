class BankAccount

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(transaction_instance)
    @balance += transaction_instance.credit
    transaction_instance.current_balance = balance
    add_transaction(transaction_instance)
  end

  def withdraw(transaction_instance)
    @balance -= transaction_instance.debit
    transaction_instance.current_balance = balance
    add_transaction(transaction_instance)
  end

  private

  def add_transaction(transaction_instance)
    @transactions << transaction_instance
  end

end
