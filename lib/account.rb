class Account

attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    new_deposit = Transaction.new(@balance, credit = amount)
    @transactions.push(new_deposit)
  end

  def withdraw(amount)
    @balance -= amount
    new_withdrawl = Transaction.new(@balance, credit = nil, debit = amount)
    @transactions.push(new_withdrawl)
  end

  def show_balance
    @balance
  end

end
