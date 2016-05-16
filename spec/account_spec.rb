require 'account'

describe Account do
  FAKE_BALANCE = rand(1000)
  let(:transaction_log) { double(:transaction_log, calculate_balance: FAKE_BALANCE) }
  let(:account) { described_class.new transaction_log}

  describe '#initialize' do
    it 'has a transaction log' do
      expect(account.transaction_log).to eq(transaction_log)
    end
  end

  describe '#calculate_balance' do
    it 'totals up the transactions' do
      expect(account.calculate_balance).to eq(FAKE_BALANCE)
    end
  end

end
