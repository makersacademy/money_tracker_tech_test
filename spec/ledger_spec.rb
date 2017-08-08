require './lib/ledger.rb'

describe Ledger do
  subject(:my_ledger) { described_class.new }
  let(:record1) { double(:record, amount: 100, date: '08/08/2017') }
  let(:record2) { double(:record, amount: 250, date: '05/08/2017') }

  describe '#attributes' do
    it 'initializes with an empty transactions array' do
      expect(my_ledger.transactions).to eq([])
    end
  end

  describe '#add_record' do
    it 'adds a record to the transaction array' do
      expect { my_ledger.add_record(record1) }.to change { my_ledger.transactions.length }.by(1)
    end
  end
end
