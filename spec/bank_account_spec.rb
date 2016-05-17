require 'bank_account'

describe BankAccount do

  let(:transaction_history){ double :transaction_history, deposit: nil, withdraw: nil, print_statement: nil }
  subject(:bank_account) { described_class.new(transaction_history) }

  describe '#initialize' do
    it 'starts with a balance of 0' do
      expect(bank_account.balance).to be_zero
    end
  end

  describe '#deposit' do
    it 'increases the balance' do
      date = "10/01/2012"
      amount = 1000
      expect{ bank_account.deposit(date, amount) }.to change{ bank_account.balance }.by amount
    end
    it 'transaction_history deposit method is called' do
      date = "10/01/2012"
      amount = 1000
      bank_account.deposit(date, amount)
      expect(bank_account.transaction_history).to have_received(:deposit)
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
    it 'transaction_history withdraw method is called' do
      date = "14/01/2012"
      amount = 500.00
      bank_account.deposit("10/01/2012", 3000)
      bank_account.withdraw(date, amount)
      expect(bank_account.transaction_history).to have_received(:withdraw)
    end
  end

  describe '#print_statement' do
    it 'calls transaction_history print_statement method' do
      bank_account.print_statement
      expect(bank_account.transaction_history).to have_received(:print_statement)
    end
  end

end
