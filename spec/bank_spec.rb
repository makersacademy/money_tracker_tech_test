require 'bank'

describe Bank do
  let(:account) { double :account}
  subject(:bank) { described_class.new }

  describe 'creaeting an account' do
    it 'allows a user to create an account' do
      bank.create_account
      # expect(bank.accounts).to include(account)
      expect(bank.accounts.size).to eq(1)
    end
  end
end
