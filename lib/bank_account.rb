class BankAccount

  AVAILABLE_BALANCE_ERROR = 'Not enough balance to withdraw'

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit date, amount
    @balance += amount
    @transactions << {date: date, credit: amount, debit: 0, balance: @balance }
  end

  def withdraw date, amount
    raise AVAILABLE_BALANCE_ERROR if @balance - amount <= 0
    @balance -= amount
    @transactions << {date: date, credit: 0, debit: amount, balance: @balance }
  end

end
