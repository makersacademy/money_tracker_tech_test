

describe Account do

  let(:transaction){ double(:transaction, end_balance: 1000, amount: 1000, date: '10/01/2012', type: 'deposit')}
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

  describe '#deposit' do

    it 'increments the balance by the amount passed in' do
      expect {account.deposit(1000, '10-01-2012')}.to change {account.balance}.by 1000
    end

    it 'adds the transaction to the statement' do
      account.deposit(1000, '10-01-2012')
      expect(account.statement).to include (transaction)
    end

  end

  describe '#withdraw' do

    before :each do
      allow(transaction).to receive(:end_balance).and_return(-500)
    end

    it 'decrements the balance by the amount passed in' do
      expect {account.withdraw(500, '14-01-2012')}.to change {account.balance}.by -500
    end

  end

  describe '#print_statement' do

    it 'prints out the statement history' do
      account.deposit(1000, '10/01/2012')
      expect{account.print_statement}.to output("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'prints out a history of only deposits if called with "deposits"' do
      account.deposit(1000, '10/01/2012')
      account.withdraw(500, '11/01/2012')
      expect{account.print_statement("deposits")}.to output("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end

  end


end
