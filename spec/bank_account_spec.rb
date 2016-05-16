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
      date = "10/01/2012"
      amount = 1000
      expect{ bank_account.deposit(date, amount) }.to change{ bank_account.balance }.by amount
    end
    it 'deposit is added to transactions array' do
      date = "10/01/2012"
      amount = 1000
      bank_account.deposit(date, amount)
      expect(bank_account.transactions).to eq [{ date:    date,
                                                 credit:  amount,
                                                 debit:   0,
                                                 balance: amount }]
    end
  end

  describe '#withdraw' do
    it 'decreases the balance' do
      bank_account.deposit("10/01/2012", 20)
      expect{ bank_account.withdraw("14/01/2012", 10) }.to change{ bank_account.balance }.by -10
    end
    it 'throws error if there is not enough available balance to withdraw' do
      message = BankAccount::AVAILABLE_BALANCE_ERROR
      expect{ bank_account.withdraw("14/01/2012", 10) }.to raise_error message
    end
    it 'withdrawal is added to transactions array' do
      date = "14/01/2012"
      amount = 500.00
      bank_account.deposit("10/01/2012", 3000)
      bank_account.withdraw(date, amount)
      expect(bank_account.transactions).to include({ date:    date, 
                                                     credit:  0,
                                                     debit:   amount,
                                                     balance: 2500 })
    end
  end

end
