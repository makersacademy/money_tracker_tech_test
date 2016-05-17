class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize(date, credit, debit, balance)
    @date = date
    @credit = '%.2f' % credit
    @debit = '%.2f' % debit.abs
    @balance = '%.2f' % balance
  end

end
