def deposit_money(money = 1000)
  visit("/")
  click_link("Deposit Money")
  fill_in("statement_deposit", with: money)
  click_button("Submit")
end

def withdrawal_money(money = 1000)
  visit("/")
  click_link("Withdrawal Money")
  fill_in("statement_withdrawal", with: money)
  click_button("Submit")
end
