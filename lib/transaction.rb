
class Transaction

  attr_reader :date, :deposit, :withdrawal, :balance

  def initialize(date: nil, deposit: nil, withdrawal: nil, balance: nil)
    @date = date
    @deposit = deposit
    @withdrawal = withdrawal
    @balance = balance
  end

end
