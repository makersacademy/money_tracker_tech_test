require_relative 'transaction.rb'
require 'date'

class MoneyTracker

  attr_reader :balance, :transaction

  def initialize(balance = 0)
    @balance = balance
    @transaction = Transaction.new
  end

  def credit(amount)
    @balance += amount
    save_transaction(format_date, amount, balance)
  end

  def debit(amount)
    @balance -= amount
    save_transaction(format_date, -amount, balance)
  end

  def save_transaction(date, amount, balance)
    @transaction.store_transaction(date, amount, balance)
  end

private

  def format_date
    Date.today.strftime("%m/%d/%Y")
  end
end
