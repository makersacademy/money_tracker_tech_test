class BankAccount

  AVAILABLE_BALANCE_ERROR = 'Not enough balance to withdraw'

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit amount
    @balance += amount
  end

  def withdraw amount
    raise AVAILABLE_BALANCE_ERROR if @balance - amount <= 0
    @balance -= amount
  end

end
