class Transaction

  attr_reader :value, :date

  def initialize(value, date)
    @value = value
    @date = date
  end

end
