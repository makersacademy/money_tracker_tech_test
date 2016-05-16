require 'transaction_log'

describe TransactionLog do
  FAKE_AMOUNT = '%.2f' % rand(1000)
  DATE = Date.new(2016,5,16)
  let(:transaction_log) { described_class.new }
  let(:transaction) { double(:transaction, calculate_change: FAKE_AMOUNT) }

  describe '#initialize' do
    it 'has an empty array' do
      expect(transaction_log.transactions).to eq([])
    end
  end

  describe '#log' do
    it 'logs transaction' do
      transaction_log.log(transaction)
      expect(transaction_log.transactions).to include(transaction)
    end
  end

  describe '#calculate_balance' do
    it 'calculates the balance' do
      transaction_log.log(transaction)
      expect(transaction_log.calculate_balance).to eq(FAKE_AMOUNT)
    end
  end

end
