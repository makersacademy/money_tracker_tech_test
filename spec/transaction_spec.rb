require 'transaction'

describe Transaction do
  DATE = Date.new(2016,5,16)
  CREDIT = '%.2f' % rand(1000)
  DEBIT = '%.2f' % rand(1000)
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

  describe '#calculate_change' do
    it 'calculates the difference between credit and debit' do
      expect(transaction.calculate_change).to eq('%.2f' % (CREDIT.to_i - DEBIT.to_i))
    end
  end
end
