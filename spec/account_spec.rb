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

    it 'makes a record of the deposit transaction' do
      account.deposit(1000, '10-01-2012')
      expect(account.transactions).to include [1000, '10-01-2012']
    end
  end

  describe '#withdrawal' do
    before do
      account.deposit(3000, '10-01-2012')
    end

    it 'can make a withdrawal' do
      expect{account.withdrawal(500, '13-01-2012')}
        .to change{account.balance}.by -500
    end

    it 'makes a record of the withdrawal transaction' do
      account.withdrawal(500, '13-01-2012')
      expect(account.transactions).to include [-500, '13-01-2012']
    end
  end
end
