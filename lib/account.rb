private

class Account

attr_accessor :balance, :history

  def initialize(balance=0)
    @balance = balance
    @history = Array.new
  end


  def new_action(amount, type, action=Transaction)
    this_action = action.new(amount, type, balance)
    record(this_action)
    this_action.make
  end

  def compile_statement(statement=Statement)
    statement.new(history).full_print_statement
  end


  def record(action)
    history << action
  end

end
