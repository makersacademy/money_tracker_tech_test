class Withdrawal

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
      update_balance
      add_self_to_transactions
      set_balance
      set_finalized
    end
  end

  private

  def update_balance
    @bank_account.balance -= @amount
  end

  def add_self_to_transactions
    @bank_account.transactions << self
  end

  def set_balance
    @balance = @bank_account.balance
  end

  def set_finalized
    @finalized = true
  end
  
end
