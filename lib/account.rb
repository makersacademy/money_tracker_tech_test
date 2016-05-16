class Account

attr_reader :statement

  def initialize(args)
    @statement ||= args[:statement]
  end

  def check_balance
    statement.latest_balance
  end
  
  def deposit(amount)
    statement.new_transaction(amount)
  end

  def withdraw(amount)
    statement.new_transaction(amount*-1)
  end 

  def print_statement
    statement.complete_log
  end
end