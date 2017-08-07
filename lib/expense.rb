require 'date'

class Expense
  attr_reader :date, :description, :debit, :credit

  def initialize(description, amount, datestring)
    @date = Date.parse(datestring)
    @description = description
    @debit = amount
    @credit = 0
  end

end
