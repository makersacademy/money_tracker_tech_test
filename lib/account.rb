require './lib/history'

class Account

  attr_reader :history

  def initialize(history: History.new)
    @history = history
  end

  def deposit(amount, date = Date.today)
    @history.deposit(amount, date)
  end

  def withdraw(amount, date = Date.today)
    @history.withdraw(amount, date)
  end



end
