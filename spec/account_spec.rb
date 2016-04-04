require './lib/account'

describe Account do
  subject(:account) {described_class.new}

  describe '#initialize and #balance' do
    it 'initialize with 0 balance' do
      expect(account.balance).to eq 0
    end
  end
end
