def create_account
  BankAccount.new("Tester Testerson")
end

def deposit_10(account)
  Deposit.new(account, 10, "01/01/2016")
end

def deposit_20(account)
  Deposit.new(account, 20, "01/01/2016")
end

def withdraw_10(account)
  Withdrawal.new(account, 10, "01/01/2016")
end

def withdraw_5(account)
  Withdrawal.new(account, 5, "01/01/2016")
end
