describe 'making a withdrawl' do

  it 'decreases the balance by the specified amount' do
    account = Account.new
    account.withdraw(500, 14-01-2012)
    expect(account.balance).to eq -500
  end

end
