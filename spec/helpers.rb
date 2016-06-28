module Helpers
  def make_deposit
    account.deposit(1000, "17/06/2016")
  end

  def make_withdrawal
    account.withdraw(1000, "17/06/2016")
  end
end
