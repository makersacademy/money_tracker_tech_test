require_relative 'tracker'

class Transaction
  attr_reader :date, :debit, :credit, :current_balance

  def initialize
    @date = DateTime.now.strftime("%d/%m/%Y")
    @debit = 0
    @credit = 0
    @current_balance = 0
  end

  def set_debit(amount)
    @debit = amount
  end

  def set_credit(amount)
    @credit = amount
  end

  def get_current_balance(balance)
    @current_balance = balance
  end
end
