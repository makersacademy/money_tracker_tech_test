class Bank

  attr_reader :name, :transactions

  def initialize(name)
    @name = name
    @transactions = []
    add_transaction("Beginning Balance", 0)
  end

  def credit(date, amount)
    add_transaction(date, amount)
  end

  def debit(date, amount)
    add_transaction(date, -amount)
  end

  def add_transaction(date, amount)
    @transactions.push(date: date, amount: amount)
  end

  def balance
    balance = 0.0
    @transactions.each do |transaction|
      balance += transaction [:amount]
    end
  return balance
  end

end
