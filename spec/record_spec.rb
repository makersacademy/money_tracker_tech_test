require './lib/record.rb'

describe Record do
  subject(:record) { described_class.new(100, '07/08/2017') }
  let(:my_ledger) { double(:ledger) }

  describe '#attributes' do
    it 'initializes with an amount and date' do
      expect(record).to have_attributes(amount: 100, date: '07/08/2017')
    end
    it 'checks the type on initialization' do
      expect(record.type).to eq(:credit)
    end
    it 'can read the amount' do
      expect(record.amount).to eq(100)
    end
    it 'can read the date' do
      expect(record.date).to eq('07/08/2017')
    end
  end

  describe '#format_record' do
    it 'formats the record and turns it into a hash' do
      expect(record.format_record).to eq(amount: 100, date: '07/08/2017', type: :credit)
    end
  end

  describe '#add_to' do
    it 'accepts one argument' do
      expect(record).to respond_to(:add_to).with(1).argument
    end

    it 'adds the record to the transactions array' do
      allow(my_ledger).to receive(:transactions).and_return([])
      record.add_to(my_ledger)
      expect(my_ledger.transactions).to eq([{ amount: 100, date: '07/08/2017', type: :credit }])
    end
  end
end
