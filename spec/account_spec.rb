require 'account'

describe Account do

  subject(:account) {described_class.new(transaction_klass)}

  let(:transaction_klass) {double :transaction_klass}

  before do
    allow(transaction_klass).to receive(:new).and_return(transaction_klass)
  end

  describe '#initialize' do

    it 'initializes with a balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'initializes with an empty statement' do
      expect(account.statement).to be_empty
    end

  end

  describe '#credit' do

    it 'allows a user to add a credit' do
      account.credit(amount: 500, date: '3/4/16')
      expect(account.balance).to eq 500
    end

    it 'adds a transaction to the statement with the correct date' do
      allow(transaction_klass).to receive(:date).and_return('3/4/16')
      account.credit(amount: 500, date: '3/4/16')
      expect(account.statement[0].date).to eq "3/4/16"
    end

    it 'adds a transaction to the statement with the correct credit ammount' do
      allow(transaction_klass).to receive(:credit).and_return(500)
      account.credit(amount: 500, date: '3/4/16')
      expect(account.statement[0].credit).to eq 500
    end

    it 'adds a transaction to the statement with the correct current balance' do
      allow(transaction_klass).to receive(:balance).and_return(500)
      account.credit(amount: 500, date: '3/4/16')
      expect(account.statement[0].balance).to eq account.balance
    end

  end

  describe '#debit' do

    it 'allows a user to make a debit' do
      account.debit(amount: 300, date: '4/4/16')
      expect(account.balance).to eq -300
    end

    it 'adds a transaction to the statement with the correct date' do
      allow(transaction_klass).to receive(:date).and_return('3/4/16')
      account.debit(amount: 500, date: '3/4/16')
      expect(account.statement[0].date).to eq "3/4/16"
    end

    it 'adds a transaction to the statement with the correct debit ammount' do
      allow(transaction_klass).to receive(:debit).and_return(500)
      account.debit(amount: 500, date: '3/4/16')
      expect(account.statement[0].debit).to eq 500
    end

    it 'adds a transaction to the statement with the correct current balance' do
      allow(transaction_klass).to receive(:balance).and_return(-500)
      account.debit(amount: 500, date: '3/4/16')
      expect(account.statement[0].balance).to eq account.balance
    end

  end

end
