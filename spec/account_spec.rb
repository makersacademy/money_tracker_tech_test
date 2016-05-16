require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'Starts with a balance' do
    expect(account.balance).to eq Account::STARTING_BALANCE
  end

  it 'Can make valid deposit' do
    account.make_deposit 50
    expect(account.balance).to eq Account::STARTING_BALANCE + 50
  end

  it 'Can make valid withdraw' do
    account.withdraw(40, 1234)
    expect(account.balance).to eq Account::STARTING_BALANCE - 40
  end

  it 'Cannot make invalid deposit' do
    account.make_deposit(-50)
    expect(account.balance).to eq Account::STARTING_BALANCE
  end

  it 'Cannot make withdraw with wrong pin' do
    account.withdraw(40, 4321)
    expect(account.balance).to eq Account::STARTING_BALANCE
  end
end
