require 'date'
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
    deposit_record.push(deposit)
  end

  def store_withdrawl_record(withdrawl)
    withdrawl_record.push(withdrawl)
  end
end
