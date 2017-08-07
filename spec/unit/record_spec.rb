require 'record'

describe Record do
  let(:date)    { Date.new(2017, 1, 1) }
  let(:amount)  { 100 }
  let(:subject) { Record.new(date, amount) }
  it { is_expected.to be_a Record }

  describe 'Initialisation' do
    it 'Has a date when initialised' do
      expect(subject.date).to eq date
    end

    it 'Has an amount when initialised' do
      expect(subject.amount).to eq amount
    end
  end
end
