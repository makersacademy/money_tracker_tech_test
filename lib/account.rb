

class Account

attr_reader :balance, :history, :action

  def initialize(balance=0, action=Transaction)
    @balance = balance
    @history = Array.new
    @action = action
  end


  def new_action(amount, type)
    action.new(amount, type).make
  end


end
