require './lib/money_tracker.rb'

describe MoneyTracker do
  subject { described_class.new }

  describe '#attributes' do
    it 'initializes with an empty expenditures array' do
      expect(subject.expenditures).to eq([])
    end
    it 'initializes with an empty earning array' do
      expect(subject.earnings).to eq([])
    end
  end
end
