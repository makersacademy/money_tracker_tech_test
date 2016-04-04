require 'account'

describe Account do
  subject(:account_klass) {described_class}
  let(:dummy_client) {double :dummy_client}
  subject(:account) {described_class.new}

  describe '#initialize' do

    it 'has a new history when the account is initialized' do
      expect(account.history).to be_empty
    end

    it 'instantiates with a balance of 0 as a default' do
      expect(account.balance).to be_zero
    end
  end
end
