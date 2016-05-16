require 'account'

describe Account do
  let(:account) { described_class.new }

  describe '#initialize' do
    it 'has a balance of 0' do
      expect(account.balance).to eq(0)
    end
  end

end
