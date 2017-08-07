require 'account'

describe Account do

  it 'can be initialized with a custom amount' do
    account = Account.new(10)
    expect(account.balance).to eq(10)
  end

  before do
    @account = Account.new
  end

  it 'is initialized with a default amount of 0' do
    expect(@account.balance).to eq(0)
  end

  it 'a client can deposit money' do
    @account.deposit(5)
    expect(@account.balance).to eq(5)
  end

  it 'does not change the balance if £0 deposited' do
    @account.deposit(0)
    expect(@account.balance).to eq(0)
  end

  it 'a client can withdraw money' do
    @account.deposit(10)
    @account.withdraw(5)
    expect(@account.balance).to eq(5)
  end

  it 'does not change the balance if £0 withdrawn' do
    @account.withdraw(0)
    expect(@account.balance).to eq(0)
  end

  it 'client can see their balance' do
    @account.deposit(20)
    expect(@account.show_balance).to eq(20)
  end

end
