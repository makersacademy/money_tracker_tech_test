require 'date'

class Spending
  attr_reader :date, :debit, :credit

  def initialize(amount, datestring)
    @date = Date.parse(datestring)
    @debit = amount
  end

end
