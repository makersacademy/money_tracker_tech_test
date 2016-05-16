require 'transaction'

describe Transaction do
  DATE = Date.new(2016,5,16)
  let(:transaction) { described_class.new DATE}

  describe '#initialize' do
    it 'has a date' do
      expect(transaction.date).to eq(DATE)
    end
  end

end
