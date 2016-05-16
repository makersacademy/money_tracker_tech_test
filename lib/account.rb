class Account

attr_reader :statement

  def initialize(args)
    @statement ||= args[:statement_class].new
    @deposit_class = args[:deposit_class]
  end

  def check_balance
    statement.last_balance
  end
  
  def deposit(amount)
    statement.new_transaction(amount)
  end

  def withdraw(amount)
    subtract_from_balance(amount)
  end 

end