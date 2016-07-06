require 'account'
require 'date'

describe Account do
  subject(:account) {described_class.new}

  describe 'Account' do
    it 'displays current balance' do
      expect(account.balance).to equal (0)
    end
    it 'increases balance when a deposit is made' do
      account.deposit(500)
      expect(account.balance).to equal (500)
    end

    it 'decreases balance when a withdrawal is made' do
      account.deposit(500)
      account.withdrawal(300)
      expect(account.balance).to equal (200)
    end

    it 'doesnt allow balance to fall below zero' do
      account.deposit(100)
      expect{account.withdrawal(200)}.to raise_error('You do not have enough funds')
    end
  end

end
