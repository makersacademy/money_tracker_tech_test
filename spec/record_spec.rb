require './lib/record.rb'

describe Record do
  subject(:record) { described_class.new(100, '07/08/2017') }
  subject(:record2) { described_class.new(0, '07/08/2017') }

  describe '#attributes' do
    it 'initializes with an amount' do
      expect(record.amount).to eq(100)
    end

    it 'initializes with a date' do
      expect(record.date).to be_a_kind_of(Date)
    end

    it 'checks the type on initialization' do
      expect(record.type).to eq(:credit)
    end

    it 'can check if the amount is valid' do
      expect { record2.amount }.to raise_error('0 is not a valid amount')
    end
  end
end
