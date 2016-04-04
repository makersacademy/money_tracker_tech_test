class Bank

  attr_reader :name

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

end
