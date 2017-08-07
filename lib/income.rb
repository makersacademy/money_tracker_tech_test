require 'date'

class Income
  attr_reader :date, :description, :debit, :credit

  def initialize(description, amount, datestring)
    @date = Date.parse(datestring)
    @description = description
    @debit = 0
    @credit = amount
  end

end
