require 'account'

describe Account do
  subject(:account) {described_class.new}

  describe 'Account' do
    it 'displays current balance' do
      expect(account.balance).to equal (0)
    end
  end
end
