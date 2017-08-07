require 'account'

describe Account do

  it 'when initialized, is an account' do
    account = Account.new
    expect(account.balance).to eq(0)
  end

  it 'can be initialized with a custom amount' do
    account = Account.new(10)
    expect(account.balance).to eq(10)
  end
  
end
