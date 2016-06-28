require 'account'

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
  end
end
