require 'statement'

describe Statement do
  let(:dummy_history) {double :dummy_history}
  let(:dummy_amount) {20}
  subject(:statement) {described_class.new(dummy_history)}

  describe '#initialize' do

    it 'is initialized with the latest history' do
      expect(statement.latest_history).to eq(dummy_history)
    end
  end

  describe '#monetize' do

    it 'puts the amount in string format with two decimal places' do
      expect(statement.monetize(dummy_amount)).to eq("20.00")
    end
  end


end
