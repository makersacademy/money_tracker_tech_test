require 'bank_account'

describe BankAccount do

  subject(:bank_account) { described_class.new }

  describe '#initialize' do
    it 'starts with a balance of 0' do
      expect(bank_account.balance).to be_zero
    end

    it 'starts with an empty transaction history' do
      expect(bank_account.transactions).to be_empty
    end
  end

  describe '#deposit' do
    it 'increases the balance' do
      expect{ bank_account.deposit(10) }.to change{ bank_account.balance }.by 10
    end
  end

  describe '#withdraw' do
    it 'decreases the balance' do
      bank_account.deposit(20)
      expect{ bank_account.withdraw(10) }.to change{ bank_account.balance }.by -10
    end
    it 'throws error if there is not enough available balance to withdraw' do
      message = BankAccount::AVAILABLE_BALANCE_ERROR
      expect{ bank_account.withdraw(10) }.to raise_error message
    end
  end

end
