# Cash deposits objects
class Deposit
  attr_reader :value, :created_time

  def initialize(value)
    @value = value
    @created_time = Date.today.to_s
  end
end
