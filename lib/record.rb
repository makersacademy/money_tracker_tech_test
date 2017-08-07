require 'date'

class Record
  attr_reader :date, :amount

  def initialize(date, amount)
    @date   = Date.parse(date)
    @amount = amount
  end
end
