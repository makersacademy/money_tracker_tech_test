require 'bank'

describe Bank do

  subject(:bank) {described_class.new}

  describe '#initialize' do
    it 'intializes with a balance' do
      expect(bank.balance).to eq 0
    end
  end
end
