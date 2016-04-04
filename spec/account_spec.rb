require './lib/account'

describe Account do
  subject(:account) {described_class.new}

  describe '#initialize and #balance' do
    it 'initialize with 0 balance and no transactions' do
      expect(account.balance).to eq 0
      expect(account.transactions).to be_empty
    end
  end

  describe '#deposit' do
    it 'can make a deposit' do
      amount = 1000
      expect{account.deposit(amount, '10-01-2012')}
        .to change{account.balance}.by amount
    end

    it 'makes a record of the transaction' do
      account.deposit(1000, '10-01-2012')
      expect(account.transactions).to include [1000, '10-01-2012']
    end
  end
end
