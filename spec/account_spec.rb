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

  it 'is initialized with an empty array of transactions' do
    expect(@account.transactions).to eq([])
  end

  it 'changes the balance on a deposit' do
    @account.deposit(5)
    expect(@account.balance).to eq(5)
  end

  it 'creates a new transaction on deposit' do
    @account.deposit(5)
    expect(@account.transactions).not_to eq([])
  end

  it 'records the deposit amount as a credit' do
    @account.deposit(5)
    expect(@account.transactions[0].credit).to eq(5)
  end

  it 'does not change the balance if £0 deposited' do
    @account.deposit(0)
    expect(@account.balance).to eq(0)
  end

  it 'changes the balance on withdrawl' do
    @account.deposit(10)
    @account.withdraw(5)
    expect(@account.balance).to eq(5)
  end

  it 'creates a new transaction on withdrawl' do
    @account.deposit(10)
    @account.withdraw(5)
    expect(@account.transactions.length).to eq(2)
  end

  it 'records a withdrawl amount as a debit' do
    @account.withdraw(5)
    expect(@account.transactions[0].debit).to eq(5)
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
