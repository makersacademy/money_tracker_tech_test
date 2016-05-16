class Transaction
  attr_reader :date, :total_credit, :total_debit

  def initialize
    @date = DateTime.now
    @total_credit = 0
    @total_debit = 0
  end

  def credit(amount)
    @total_credit += amount
  end

  def debit(amount)
    @total_debit -= amount
  end
end
