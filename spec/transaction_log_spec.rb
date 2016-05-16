require 'transaction_log'

describe TransactionLog do
  let(:transaction1) { double(:transaction, total: 600) }
  let(:transaction2) { double(:transaction, total: 100) }

  describe '#initialize' do
    it 'starts with an empty history' do
      expect(subject.transactions).to be_empty
    end
  end

  describe '#add_new' do
    it { is_expected.to respond_to(:add_new).with(1).argument }
    it 'adds a transaction to the transaction history' do
      subject.add_new(transaction1)
      expect(subject.transactions).to eq [transaction1]
    end
  end

  describe '#calculate_total' do
    it 'calculates the total of all credits and debits in transaction log' do
      subject.add_new(transaction1)
      subject.add_new(transaction2)
      expect(subject.total).to eq 700
    end
  end
end
