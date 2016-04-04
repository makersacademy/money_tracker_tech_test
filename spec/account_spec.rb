require 'account'

describe Account do

  subject(:account) {described_class.new}

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
      account.deposit(500, '3/4/16')
      expect(account.balance).to eq 500
    end

    it 'adds a transaction to the statement' do
      account.deposit(500, '3/4/16')
      expect(account.statement).to include date: "3/4/16", deposit: 500, withdrawal: 0, balance: 500
    end

  end

  describe '#withdraw' do

    it 'allows a user to make a withdrawal' do
      account.withdraw(300, '4/4/16')
      expect(account.balance).to eq -300
    end

  end

end
