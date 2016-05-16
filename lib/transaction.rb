require 'Date'

class Transaction
  attr_reader :date, :amount

  def initialize(amount, date)
    @amount = amount
    @date = date || Date.new
  end
end
