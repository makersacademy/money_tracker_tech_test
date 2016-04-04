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

  describe '#deposit' do

    it 'allows a user to add a deposit' do
      account.deposit(amount: 500, date: '3/4/16')
      expect(account.balance).to eq 500
    end

    it 'adds a transaction to the statement with the correct date' do
      allow(transaction_klass).to receive(:date).and_return('3/4/16')
      account.deposit(amount: 500, date: '3/4/16')
      expect(account.statement[0].date).to eq "3/4/16"
    end

    it 'adds a transaction to the statement with the correct deposit ammount' do
      allow(transaction_klass).to receive(:deposit).and_return(500)
      account.deposit(amount: 500, date: '3/4/16')
      expect(account.statement[0].deposit).to eq 500
    end

    it 'adds a transaction to the statement with the correct current balance' do
      allow(transaction_klass).to receive(:balance).and_return(500)
      account.deposit(amount: 500, date: '3/4/16')
      expect(account.statement[0].balance).to eq account.balance
    end

  end

  describe '#withdraw' do

    it 'allows a user to make a withdrawal' do
      account.withdraw(amount: 300, date: '4/4/16')
      expect(account.balance).to eq -300
    end

    it 'adds a transaction to the statement with the correct date' do
      allow(transaction_klass).to receive(:date).and_return('3/4/16')
      account.withdraw(amount: 500, date: '3/4/16')
      expect(account.statement[0].date).to eq "3/4/16"
    end

    it 'adds a transaction to the statement with the correct withdrawal ammount' do
      allow(transaction_klass).to receive(:withdrawal).and_return(500)
      account.withdraw(amount: 500, date: '3/4/16')
      expect(account.statement[0].withdrawal).to eq 500
    end

    it 'adds a transaction to the statement with the correct current balance' do
      allow(transaction_klass).to receive(:balance).and_return(-500)
      account.withdraw(amount: 500, date: '3/4/16')
      expect(account.statement[0].balance).to eq account.balance
    end

  end

end
