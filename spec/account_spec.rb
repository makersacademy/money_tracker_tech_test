require 'account'

describe Account do

  DEPOSIT_AMOUNT1 = 1000
  WITHDRAWAL_AMOUNT1 = 500
  DATE1 = Date.new(2012,1,10)
  DATE2 = Date.new(2012,1,13)
  subject(:account) { described_class.new }

  it { is_expected.to respond_to(:deposit).with(2).arguments }
  
  it 'will add the balance passed to deposit to the balance' do
    account.deposit(DEPOSIT_AMOUNT1, DATE1)
    expect(account.balance).to eq DEPOSIT_AMOUNT1
  end

  it 'will deduct the balance passed to deposit from the balance' do
    account.deposit(DEPOSIT_AMOUNT1, DATE1)
    account.withdraw(WITHDRAWAL_AMOUNT1, DATE2)
    expect(account.balance).to eq DEPOSIT_AMOUNT1 - WITHDRAWAL_AMOUNT1
  end

  it 'will add the deposit to the statement' do
    account.deposit(DEPOSIT_AMOUNT1, DATE1)
    expect(account.statement.length).to eq 1
  end

  it 'will add the amount of the deposit to the statement' do
    account.deposit(DEPOSIT_AMOUNT1, DATE1)
    expect(account.statement).to include(DEPOSIT_AMOUNT1)
  end

  it 'will add the withdrawal to the statement' do
    account.withdraw(WITHDRAWAL_AMOUNT1, DATE2)
    expect(account.statement.length).to eq 1
  end

  it 'will add the negative of the amount of the deposit to the statement' do
    account.withdraw(WITHDRAWAL_AMOUNT1, DATE2)
    expect(account.statement).to include(WITHDRAWAL_AMOUNT1 * -1)
  end
  

  it 'will initialize with a balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'will intitialize with an empty statement' do
    expect(account.statement).to eq []
  end
 

end

