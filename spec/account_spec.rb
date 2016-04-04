require './lib/account'

describe Account do
  subject(:account) { described_class.new }
  let(:amount) {1000}

  describe '#initialize and #balance' do
    it 'initialize with 0 balance and no transactions' do
      expect(account.balance).to eq 0
      expect(account.transactions).to be_empty
    end
  end

  describe '#deposit' do
    it 'can make a deposit' do
      expect{account.deposit(amount, '10-01-2012')}
        .to change{account.balance}.by amount
    end

    it 'makes a record of the deposit transaction' do
      account.deposit(amount, '10-01-2012')
      expect(account.transactions).to include \
        ({amount:amount, date:'10-01-2012', balance: amount})
    end
  end

  describe '#withdrawal' do
    it 'can make a withdrawal' do
      expect{account.withdrawal(amount, '13-01-2012')}
        .to change{account.balance}.by -amount
    end

    it 'makes a record of the withdrawal transaction' do
      account.withdrawal(amount, '13-01-2012')
      expect(account.transactions).to include \
        ({amount:-amount, date:'13-01-2012', balance: -amount})
    end
  end
end
