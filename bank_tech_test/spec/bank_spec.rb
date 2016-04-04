require 'bank'

describe Bank do
  subject(:bank) {described_class.new}

  describe 'deposit' do
    it 'can be made' do
      bank.make_deposit('100')
      expect(bank.account_balance).to eq ('100')
    end
  end
end
