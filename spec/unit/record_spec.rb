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
  end
end
