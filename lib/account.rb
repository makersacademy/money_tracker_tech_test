# Represents a bank account
class Account
  attr_reader :current_balance, :transaction_record

  def initialize
    @current_balance = 0
    @transaction_record = []
  end

  def deposit(deposit)
    @current_balance += deposit.value
    store_transaction_record(deposit)
  end

  def withdraw(withdrawl)
    @current_balance -= withdrawl.value
    store_transaction_record(withdrawl)
  end

  private

  def store_transaction_record(transaction)
    deposit_array = [transaction, current_balance]
    transaction_record.push(deposit_array)
  end
end
