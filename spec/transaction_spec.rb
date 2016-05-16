require_relative '../lib/transaction'

describe Transaction do

  date = Time.now.strftime("%d/%m/%Y")
  amount = 1000
  subject(:transaction) { described_class.new(amount, empty_account) }

  let(:empty_account) { double(:account, balance: 0) }

  describe '#initialize' do
    it 'initializes with a date and amout' do
      expect(transaction.date).to eq(date)
    end
    it 'initializes with an amount' do
      expect(transaction.amount).to eq(amount)
    end
    it 'initializes with an account' do
      expect(transaction.account.balance).to eq(0)
    end
  end
end
