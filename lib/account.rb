class Account

  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = {}
  end

end
