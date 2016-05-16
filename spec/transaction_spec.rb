require_relative '../lib/transaction'

describe Transaction do

  date = Time.now.strftime("%d/%m/%Y")
  amount = 1000
  subject(:transaction) { described_class.new(amount) }

  describe '#initialize' do
    it 'initializes with a date and amout' do
      expect(transaction.date).to eq(date)
    end
    it 'initializes with an amount' do
      expect(transaction.amount).to eq(amount)
    end
  end
end
