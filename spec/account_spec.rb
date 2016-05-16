require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'Starts with a balance' do
    expect(account.get_balance).to eq Account::STARTING_BALANCE
  end
end
