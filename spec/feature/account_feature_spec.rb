require "account"

describe 'Account features' do

  it 'prints users transactions' do
    account = Account.new
    date = Time.now.strftime("%d/%m/%Y")
    account.deposit(500)
    account.withdrawal(400)
    expect(account.statement.statement).to include ({ date: date, amount: 400, balance: 100 })
  end
end
