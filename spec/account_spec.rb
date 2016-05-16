require 'account'

describe Account do
  let(:transaction_log) { double(:transaction_log, total: 100) }

  subject { described_class.new(transaction_log) }

  describe 'balance' do
    it 'is equal to the transaction log total' do
      expect(subject.balance).to eq transaction_log.total
    end
  end

  describe 'transaction_log' do
    it 'has a history of account transactions' do
      expect(subject.transaction_log).to eq transaction_log
    end
  end

end
