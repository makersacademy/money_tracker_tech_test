require_relative 'transactions.rb'
require 'date'

class MoneyTracker

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = Transactions.new
  end

  def credit(amount)
    @balance += amount
    save_transaction(amount, balance)
  end

  def debit(amount)
    @balance -= amount
    save_transaction(-amount, balance)
  end

  def print_statement
    @transactions.format_statement
  end

  private

  def save_transaction(amount, balance)
    @transactions.store_transaction(amount, balance)
  end
end
