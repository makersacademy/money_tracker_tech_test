class BankAccount

  INITIAL_BALANCE = 0

  attr_reader :balance

  def initialize(statement = Statement.new)
    @balance = INITIAL_BALANCE
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    @statement.add_entry("deposit   +#{amount}", balance)
  end

  def withdraw(amount)
    @balance -= amount
    @statement.add_entry("withdrawl -#{amount}", balance)
  end
end
