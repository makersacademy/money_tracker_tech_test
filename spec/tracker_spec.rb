require 'tracker.rb'

describe Tracker do
  subject(:tracker) { described_class.new }
  let(:transaction) { double :transaction, date: '02/08/2017', amount: 1300 }
  # let(:formatter) { double :statement_formatter}

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

  # describe '#show_statement' do
  #   it 'prints out all the records' do
  #     tracker.record_transaction(transaction)
  #     tracker.record_transaction(transaction2)
  #     allow(transaction).to receive(:format_for_statement).and_return('02/08/2017 || 1300.00 || || ')
  #     allow(transaction2).to receive(:format_for_statement).and_return('07/08/2017 || || 600.00 || ')
  #
  #     expect(tracker.show_statement).to eq "date || earning || spending || balance\n" +
  #                                           "02/08/2017 || 1300.00 || || 1300.00\n" +
  #                                           "07/08/2017 || || 600.00 || 700.00\n"
  #   end
  # end
end
