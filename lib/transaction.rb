class Transaction

  attr_reader :list

  def initialize
    @list = []
  end

  def store_transaction(date, amount, balance)
    self.list.push({date: date, amount: amount, balance: balance})
  end
end
