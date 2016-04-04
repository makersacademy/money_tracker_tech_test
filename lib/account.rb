
class Account

attr_reader :history
attr_accessor :balance

  def initialize(balance=0)
    @balance = balance
    @history = Array.new
  end


  def new_action(amount, type, action=Transaction)
    action = action.new(amount, type, self)
    action.make
  end

  def compile_statement(statement=Statement)
    statement.new(history).print_format
  end

end
