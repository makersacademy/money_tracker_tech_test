require_relative '../lib/account'

describe Account do

  let(:transaction_class) { double(:transaction_class, new: transaction) }
  let(:transaction) { double(:transaction) }
  subject(:account) { described_class.new(transaction_class) }

  describe '#initialize' do
    it 'initializes with a balance of zero' do
      expect(account.balance).to eq 0
    end

    it 'initializes with an empty history' do
      expect(account.history).to eq []
    end
  end

  describe '#withdraw' do
    it 'creates a transaction with negative integer as amount' do
      account.withdraw(-500)
      expect(transaction_class).to have_received(:new)
    end
  end
end
