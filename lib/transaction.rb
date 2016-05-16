require 'Date'

class Transaction
  attr_reader :credit, :debit, :date

  def initialize(credit: nil, debit: nil, date: date)
    @credit = credit
    @debit = debit
    @date = date || Date.new
  end
end
