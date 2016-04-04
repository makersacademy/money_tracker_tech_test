class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    @transactions.push ({amount: amount, date: date, balance: balance})
  end

  def withdrawal(amount, date)
    @balance -= amount
    @transactions.push ({amount: -amount, date: date, balance: balance})
  end
end
