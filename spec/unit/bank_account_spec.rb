require 'bank_account'

describe BankAccount do
  subject(:account)   { described_class.new }

  describe '#deposit' do
    it 'can increase the balance' do
      expect{account.deposit(1000)}.to change{account.balance}.from(0).to(1000)
    end
  end

  describe '#withdraw' do
    it 'can decrease the balance' do
      account.deposit(50)
      expect{account.deposit(50)}.to change{account.balance}.from(50).to(100)
    end
  end

end
