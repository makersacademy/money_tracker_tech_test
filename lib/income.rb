require 'date'

class Income
  attr_reader :date, :debit, :credit

  def initialize(amount, datestring)
    @date = Date.parse(datestring)
    @debit = 0
    @credit = amount
  end

end
