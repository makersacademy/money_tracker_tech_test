class Transaction
  attr_reader :date, :credit, :debit

  def initialize(date, credit=0, debit=0)
    @date = date
    @credit = two_sf(credit)
    @debit = two_sf(debit)
  end

  def calculate_change
    two_sf(@credit.to_i - @debit.to_i)
  end

  def is_deposit?
    !(credit == "0.00")
  end

  def is_withdrawal?
    !(debit == "0.00")
  end

  private

  def two_sf(amount)
    '%.2f' % amount
  end
end
