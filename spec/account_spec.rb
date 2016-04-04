

describe Account do

  let(:transaction){ double(:transaction, end_balance: 1000)}
  let(:transaction_klass) {double(:transaction_klass, new: transaction)}
  let(:account){ described_class.new(transaction_klass) }

  context 'on initialization' do

    it 'initializes with a balance of zero' do
      expect(account.balance).to eq 0
    end

    it 'initializes with an empty account statement' do
      expect(account.statement).to be_empty
    end

  end

  describe 'deposit' do

    it 'increments the balance by the amount passed in' do
      expect {account.deposit(1000, '10-01-2012')}.to change {account.balance}.by 1000
    end

    it 'adds the transaction to the statement' do
      account.deposit(1000, '10-01-2012')
      expect(account.statement).to include (transaction)
    end

  end


end
