# Represents a bank account
class Account
  attr_reader :current_balance, :deposit_record, :withdrawl_record

  def initialize
    @current_balance = 0
    @deposit_record = []
    @withdrawl_record = []
  end

  def deposit(deposit)
    @current_balance += deposit.value
    store_deposit_record(deposit)
  end

  def withdraw(withdrawl)
    @current_balance -= withdrawl.value
    store_withdrawl_record(withdrawl)
  end

  private

  def store_deposit_record(deposit)
    deposit_array = [deposit, current_balance]
    deposit_record.push(deposit_array)
  end

  def store_withdrawl_record(withdrawl)
    withdrawl_array = [withdrawl, current_balance]
    withdrawl_record.push(withdrawl_array)
  end
end
