require 'account'

xdescribe 'User makes a deposit' do
  it 'adds the deposit amount to the account balance' do
    account = Account.new
    account.deposit(1000)
    expect(account.balance).to eq 1000
  end
end
