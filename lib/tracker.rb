require_relative 'transaction'
require 'date'

class Tracker
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def record_debit(amount, transaction)
    set_balance(-amount)
    transaction.set_debit(amount)
  end

  def record_credit(amount, transaction)
    set_balance(amount)
    transaction.set_credit(amount)
  end

  private
    def set_balance(amount)
      @balance += amount
    end
end
