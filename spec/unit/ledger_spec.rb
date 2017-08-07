describe Ledger do
  let(:date)   { Date.parse('01-01-2017') }
  let(:amount) { 100 }
  let(:ledger) { described_class.new }

  let(:record) do
    record = double('record')
    allow(record).to receive(:date)   { date }
    allow(record).to receive(:amount) { amount }
    record
  end

  describe 'Initialisation' do
    it { is_expected.to respond_to :transactions }

    it 'Begins with no transactions' do
      expect(ledger.transactions).to be_empty
    end
  end

  describe '#record' do
    it { is_expected.to respond_to :record }

    it 'Pushes the record to the transactions array' do
      ledger.record(record)
      expect(ledger.transactions.first).to eq record
    end
  end
end
