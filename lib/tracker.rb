require_relative 'transaction'
require 'date'

class Tracker
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def record_debit(amount, transaction)
    transaction.set_debit(-amount)
    set_balance(-amount)
  end

  def record_credit(amount, transaction)
    transaction.set_credit(amount)
    set_balance(amount)
    transaction.get_current_balance(@balance)
  end

  private
    def set_balance(amount)
      @balance += amount
    end
end
