require 'account'

describe Account do

  subject(:account) {described_class.new}

  describe '#initialize' do

    it 'initializes with a balance of 0' do
      expect(account.balance).to eq 0
    end

  end

  describe '#deposit' do

    it 'allows a user to add a deposit' do
      account.deposit(500)
      expect(account.balance).to eq 500
    end

  end

end
