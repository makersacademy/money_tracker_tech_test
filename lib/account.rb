require 'date'
# Represents a bank account
class Account
  attr_reader :current_balance, :deposit_record, :withdrawl_record

  def initialize
    @current_balance = 0
    @deposit_record = {}
    @withdrawl_record = {}
  end

  def deposit(amount)
    @current_balance += amount
    add_deposit_record(amount)
  end

  def withdraw(amount)
    @current_balance -= amount
    add_withdrawl_record(amount)
  end

  def add_deposit_record(amount)
    @deposit_record[Date.today.to_s] = amount
  end

  def add_withdrawl_record(amount)
    @withdrawl_record[Date.today.to_s] = amount
  end
end
