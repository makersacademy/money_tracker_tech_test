require './lib/record.rb'

describe Record do
  subject(:record) { described_class.new(100, '07/08/2017') }
  subject(:record2) { described_class.new(0, '07/08/2017') }
  let(:my_ledger) { double(:ledger) }

  describe '#attributes' do
    it 'initializes with an amount and date' do
      expect(record).to have_attributes(amount: 100, date: '07/08/2017')
    end

    it 'checks the type on initialization' do
      expect(record.type).to eq(:credit)
    end

    it 'can check if the amount is valid' do
      expect { record2.amount }.to raise_error('0 is not a valid amount')
    end

    it 'can read the date' do
      expect(record.date).to eq('07/08/2017')
    end
  end
end
