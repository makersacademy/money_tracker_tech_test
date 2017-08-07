require_relative 'tracker'

class Transaction
  attr_reader :date, :debit, :credit

  def initialize
    @date = DateTime.now.strftime("%d/%m/%Y")
    @debit = 0
    @credit = 0
  end

  def set_debit(amount)
    @debit = amount
  end

  def set_credit(amount)
    @credit = amount
  end
end
