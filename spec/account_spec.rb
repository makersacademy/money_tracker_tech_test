require 'account'

describe Account do
  let(:transaction_log) { double(:transaction_log) }

  subject { described_class.new(transaction_log) }

  describe 'balance' do
    it 'initializes at 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe 'transaction_log' do
    it 'has a history of account transactions' do
      expect(subject.transaction_log).to eq transaction_log
    end
  end
end
