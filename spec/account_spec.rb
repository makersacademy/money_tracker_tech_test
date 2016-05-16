require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'Starts with a balance' do
    expect(account.get_balance).to eq Account::STARTING_BALANCE
  end

  it 'Can make deposits' do
    account.make_deposit 50
    expect(account.get_balance).to eq Account::STARTING_BALANCE + 50
  end

  it 'Can withdraw' do
    account.withdraw 40
    expect(account.get_balance).to eq Account::STARTING_BALANCE - 40
  end
end
