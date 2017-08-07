class Tracker

  attr_reader :balance, :debit, :credit

  def initialize
    @balance = 0
    @debit = 0
    @credit = 0
  end

  def record_debit(amount)
    @debit = amount
    set_balance(-amount)
  end

  def record_credit(amount)
    @credit = amount
    set_balance(amount)
  end

  private
    def set_balance(amount)
      @balance += amount
    end
end
