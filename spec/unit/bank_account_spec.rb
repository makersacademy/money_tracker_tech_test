require 'bank_account'

describe BankAccount do
  subject(:account)   { described_class.new }

  describe '#deposit' do
    it 'can increase the balance' do
      account.deposit(1000)
      expect(account.balance).to eq 1000
    end
  end

  describe '#withdraw' do
    it 'can decrease the balance' do
      account.deposit(500)
      expect(account.balance).to eq 500
    end
  end

end
