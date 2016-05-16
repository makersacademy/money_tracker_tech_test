require 'bank_account'

HEADERS = 'date || credit || debit || balance'
DEPOSIT_STRING = '01/01/1970 || 100 ||  || 100'
WITHDRAW_STRING = '02/01/1970 ||  || 100 || 0'

describe BankAccount do
  let(:dummy_transaction_log_class) { double :TransactionLog, new: nil}
  subject(:test_account) { described_class.new dummy_transaction_log_class}

  describe '#deposit' do

    it 'creates a new deposit transaction' do
      test_account.deposit Date.new(1970,1,1), 100
      expect(dummy_transaction_log_class).to have_received(:new).with Date.new(1970,1,1), 100, 100
    end

  end

  describe '#withdraw' do

    it 'creates a new withdraw transaction' do
      test_account.withdraw Date.new(1970,1,1), 100
      expect(dummy_transaction_log_class).to have_received(:new).with Date.new(1970,1,1), -100, -100
    end

  end

  describe '#print_statement' do

    before :each do
      test_account.deposit Date.new(1970,1,1), 100
      test_account.withdraw Date.new(1970,1,2), 100
    end

    it 'returns a string with the right headers' do
      expect(test_account.print_statement).to include HEADERS
    end

    it 'returns a string with the right transactions' do
      puts test_account.print_statement
      expect(test_account.print_statement).to include DEPOSIT_STRING
      expect(test_account.print_statement).to include WITHDRAW_STRING
    end

  end

end
