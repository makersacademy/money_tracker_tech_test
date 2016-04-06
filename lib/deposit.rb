class Deposit

  attr_reader :date, :amount, :balance

  def initialize(bank_account, amount, date)
    @bank_account = bank_account
    @amount = amount
    @date = date
    @finalized = false
    @balance = 0
  end

  def finalize
    if !@finalized
      @bank_account.balance += @amount
      @bank_account.transactions << self
      @balance = @bank_account.balance
      @finalized = true
    end
  end

end
