require 'transaction'

describe Transaction do

  subject(:transaction) {described_class.new}

  describe '#initialize' do

    it 'initializes with an empty transaction' do
      expect(transaction.details).to eq date: nil, deposit: 0, withdrawal: 0, balance: 0
    end

  end

end
