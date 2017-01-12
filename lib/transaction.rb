# superclass for deposit and withdrawl
class Transaction
  attr_reader :value, :created_time

  def initialize(value)
    @value = value
    @created_time = Date.today.to_s
  end
end
