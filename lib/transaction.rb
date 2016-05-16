class Transaction

  attr_reader :date, :credit, :debit

  def initialize(date, credit=0, debit=0)
    @date = date
    @credit = '%.2f' % credit
    @debit = '%.2f' % debit
  end

  def calculate_change
    return '%.2f' % (@credit.to_i - @debit.to_i)
  end

end
