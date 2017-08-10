require 'tracker.rb'

describe Tracker do
  subject(:tracker) { described_class.new }
  let(:transaction) { double :transaction, date: '02/08/2017', amount: 1300 }
  let(:formatter) { double :statement_formatter}

  describe '#initialize' do
    it 'generates an empty array of transactions' do
      expect(tracker.transactions).to be_empty
    end

    it 'generates a new instance of statement formatter' do
      expect(tracker.formatter).not_to be_nil
    end
  end

  describe '#record_transaction' do
    it 'adds the transaction to the transactions history' do
      tracker.record_transaction(transaction)
      expect(tracker.transactions).to eq [transaction]
    end
  end

  describe '#show_statement' do
    it 'prints out all the records' do
      tracker.record_transaction(transaction)
      allow(formatter).to receive(:create_statement).and_return "date || earning || spending || balance\n" +
                                                                "02/08/2017 || 1300.00 || || 1300.00\n"
      expect(tracker.show_statement).to eq "date || earning || spending || balance\n" +
                                            "02/08/2017 || 1300.00 || || 1300.00\n"
    end
  end
end
