require 'transaction'

describe Transaction do

  subject(:transaction) {described_class.new}

  describe '#initialize' do

    it 'initializes with an empty date' do
      expect(transaction.date).to eq nil
    end

    it 'initializes with an empty deposit' do
      expect(transaction.credit).to eq nil
    end

    it 'initializes with an empty withdrawal' do
      expect(transaction.debit).to eq nil
    end

    it 'initializes with an empty balance' do
      expect(transaction.balance).to eq nil
    end

  end

end
