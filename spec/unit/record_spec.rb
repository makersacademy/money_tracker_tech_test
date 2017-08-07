require 'record'

describe Record do
  let(:date)    { '01-01-2017' }
  let(:amount)  { 100 }
  let(:subject) { described_class.new(date, amount) }

  describe 'Initialisation' do
    it 'Has a date when initialised' do
      expect(subject.date.to_s).to eq '2017-01-01'
    end

    it 'Has an amount when initialised' do
      expect(subject.amount).to eq amount
    end

    it 'Raises an error if amount is invalid' do
      expect { Record.new(date, 'not a number' ) }.to raise_error 'Invalid transaction amount'
    end
  end

  describe 'Transaction Types' do
    it 'Lists a positive amount as credit' do
      expect(subject.type).to eq 'Credit'
    end

    it 'Lists a negative amount as debit' do
      negative_record = Record.new(date, -100)
      expect(negative_record.type).to eq 'Debit'
    end
  end
end
