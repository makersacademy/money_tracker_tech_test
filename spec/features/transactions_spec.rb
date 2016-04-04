require 'account'

describe 'User can view a statement of their transactions' do
  it 'displays a log transactions, dates and account balance' do
    account = Account.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect(account.balance).to eq 2500
    expect(account.statement.count).to eq 3

    latest_transaction = account.statement.last
    puts latest_transaction
    expect(latest_transaction[:type]).to eq :withdrawal
    # expect(latest_transaction[:date]).to eq Date.new(2012,1,14)
    expect(latest_transaction[:amount]).to eq 500
  end
end
