require 'bank_account'

HEADERS = 'date || credit || debit || balance'
DEPOSIT_STRING = 'test deposit'
WITHDRAW_STRING = 'test withdrawal'
DUMMY_DATE1 = Date.new(1970,1,1)
DUMMY_DATE2 = Date.new(1970,1,2)

describe BankAccount do
  let(:dummy_transaction_log_class) { double :TransactionLog }
  subject(:test_account) { described_class.new dummy_transaction_log_class }

  before :each do
    allow(dummy_transaction_log_class).to receive :new do |_, amount|
      amount.positive? ? 'test deposit' : 'test withdrawal'
    end
  end

  describe '#deposit' do

    it 'creates a new deposit transaction with the new balance' do
      test_account.deposit DUMMY_DATE1, 100
      expect(dummy_transaction_log_class).to have_received(:new).with DUMMY_DATE1, 100, 100
    end

  end

  describe '#withdraw' do

    it 'creates a new withdraw transaction with the new balance' do
      test_account.withdraw DUMMY_DATE1, 100
      expect(dummy_transaction_log_class).to have_received(:new).with DUMMY_DATE1, -100, -100
    end

  end

  describe '#print_statement' do

    before :each do
      test_account.deposit DUMMY_DATE1, 100
      test_account.withdraw DUMMY_DATE2, 100
    end

    it 'returns a string with the right headers' do
      expect(test_account.print_statement).to include HEADERS
    end

    it 'returns a string with the deposit transaction' do
      expect(test_account.print_statement).to include DEPOSIT_STRING
    end

    it 'returns a string with the withdrawal transaction' do
      expect(test_account.print_statement).to include WITHDRAW_STRING
    end

    it 'returns the transactions in the right order' do
      expect(test_account.print_statement).to include WITHDRAW_STRING + "\n" + DEPOSIT_STRING
    end

  end

end
