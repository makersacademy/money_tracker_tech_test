
class Transaction
  attr_reader :credit, :debit, :time, :balance

  def initialize(credit: 0, debit: 0, time: Time.now, balance: current_balance)
    @credit = credit
    @debit = debit
    @time = time
    @balance = balance
  end
end
