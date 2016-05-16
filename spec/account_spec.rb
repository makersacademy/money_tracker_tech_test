require './lib/account'

describe Account do

  subject(:account) { described_class.new(transaction_class: transaction_class) }

  let(:transaction_class) { double(:transaction_class, new: transaction) }
  let(:transaction) { double(:transaction) }

  describe '#initialize' do
    it 'initializes with a balance of zero' do
      expect(account.balance).to eq 0
    end

    it 'initializes with an empty history' do
      expect(account.history).to eq []
    end
  end

  describe '#withdraw' do

    before(:each) do
      account.withdraw(500)
    end

    it 'creates a transaction with negative integer as amount' do
      expect(transaction_class).to have_received(:new).with(-500, -500)
    end

    it 'subtract a given amount from the balance' do
      expect(account.balance).to eq -500
    end

    it 'stores a transaction in the history' do
      last_transaction = account.history.last
      expect(last_transaction).to eq transaction
    end
  end

  describe '#deposit' do

    before(:each) do
      account.deposit(500)
    end

    it 'creates a transaction with negative integer as amount' do
      expect(transaction_class).to have_received(:new).with(500, 500)
    end

    it 'subtract a given amount from the balance' do
      expect(account.balance).to eq +500
    end

    it 'stores a transaction in the history' do
      last_transaction = account.history.last
      expect(last_transaction).to eq transaction
    end
  end
end
