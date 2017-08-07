require 'account'

describe Account do

  it 'can be initialized with a custom amount' do
    account = Account.new(10)
    expect(account.balance).to eq(10)
  end

  it 'changes the balance on a deposit' do
    subject.deposit(5)
    expect(subject.balance).to eq(5)
  end

  it 'creates a new transaction on deposit' do
    subject.deposit(5)
    expect(subject.transactions).not_to eq([])
  end

  it 'records the deposit amount as a credit' do
    subject.deposit(5)
    expect(subject.transactions[0].credit).to eq(5)
  end

  it 'does not change the balance if £0 deposited' do
    subject.deposit(0)
    expect(subject.balance).to eq(0)
  end

  it 'changes the balance on withdrawl' do
    subject.deposit(10)
    subject.withdraw(5)
    expect(subject.balance).to eq(5)
  end

  it 'creates a new transaction on withdrawl' do
    subject.deposit(10)
    subject.withdraw(5)
    expect(subject.transactions.length).to eq(2)
  end

  it 'records a withdrawl amount as a debit' do
    subject.withdraw(5)
    expect(subject.transactions[0].debit).to eq(5)
  end

  it 'does not change the balance if £0 withdrawn' do
    subject.withdraw(0)
    expect(subject.balance).to eq(0)
  end

  it 'client can see their balance' do
    subject.deposit(20)
    expect(subject.show_balance).to eq(20)
  end

end
