require 'account'

describe Account do
  FAKE_AMOUNT = '%.2f' % rand(1000)
  DATE = Date.new(2016,5,16)
  let(:account) { described_class.new }
  let(:transaction) { double(:transaction, calculate_change: FAKE_AMOUNT) }

  describe '#initialize' do
    it 'has an empty array' do
      expect(account.transactions).to eq([])
    end
  end

  describe '#log' do
    it 'logs transaction' do
      account.log(transaction)
      expect(account.transactions).to include(transaction)
    end
  end

  describe '#calculate_balance' do
    it 'calculates the balance' do
      account.log(transaction)
      expect(account.calculate_balance).to eq(FAKE_AMOUNT)
    end
  end

end
