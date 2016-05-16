require 'transaction'

describe Transaction do
  DATE = Date.new(2016,5,16)
  CREDIT = rand(1000)
  DEBIT = rand(1000)
  let(:transaction) { described_class.new DATE, CREDIT, DEBIT}

  describe '#initialize' do
    it 'has a date' do
      expect(transaction.date).to eq(DATE)
    end

    it 'has a credited amount' do
      expect(transaction.credit).to eq(CREDIT)
    end

    it 'has a debited amount' do
      expect(transaction.debit).to eq(DEBIT)
    end
  end
end
