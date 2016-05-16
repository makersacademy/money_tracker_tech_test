require 'transaction_log'

describe TransactionLog do
  let(:transaction) { double(:transaction) }
  
  describe '#initialize' do
    it 'starts with an empty history' do
      expect(subject.transactions).to be_empty
    end
  end

  describe '#add_new' do
    it { is_expected.to respond_to(:add_new).with(1).argument }
    it 'adds a transaction to the transaction history' do
      subject.add_new(transaction)
      expect(subject.transactions).to eq [transaction]
    end
  end
end
