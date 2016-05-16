require 'transaction_log'

describe TransactionLog do
  let(:transaction_log) { described_class.new }
  let(:transaction) { double(:transaction) }

  describe '#initialize' do
    it 'has an empty array' do
      expect(transaction_log.transactions).to eq([])
    end
  end

  describe '#log' do
    it 'logs transaction' do
      transaction_log.log(transaction)
      expect(transaction_log.transactions).to include(transaction)
    end
  end

end
