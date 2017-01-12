# superclass for deposit and withdrawl
class Transaction
  attr_reader :value, :created_date

  def initialize(value)
    @value = value
    @created_date = Date.today.to_s
  end
end
