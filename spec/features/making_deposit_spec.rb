describe 'making a deposit' do

  it 'increases the balance by the specified amount' do
    account = Account.new
    account.deposit(1000, 10-01-2012)
    expect(account.balance).to eq(1000)
  end

end
