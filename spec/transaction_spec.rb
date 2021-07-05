
require_relative '../lib/transaction'
require_relative '../lib/transaction_log'

describe Transaction do
  let(:current_time) { Time.now }
  let(:transaction_log) { double(:transaction_log) }

  describe '#init' do
    before do
      allow(TransactionLog).to receive(:instance).and_return(transaction_log)
      allow(transaction_log).to receive(:log)
    end
    it 'will log self' do
      described_class.new(credit: 0, time: current_time, debit: 50)
      expect(transaction_log).to have_received(:log)
    end
  end
end
