class Transaction
  attr_reader :date, :credit, :debit

  def initialize(date, credit=0, debit=0)
    @date = date
    @credit = credit
    @debit = debit
  end

  def calculate_change
    @credit - @debit
  end

  def deposit_or_withdrawal?
    return :deposit if !(credit == 0)
    :withdrawal if !(debit == 0)
  end

  private

  def two_sf(amount)
    '%.2f' % amount
  end
end
