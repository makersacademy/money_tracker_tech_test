require 'bank_account'

HEADERS = 'date || credit || debit || balance'
DEPOSIT_STRING = '01test deposit'
WITHDRAW_STRING = '02test withdrawal'

describe BankAccount do
  let(:dummy_transaction_log_class) { double :TransactionLog}
  subject(:test_account) { described_class.new dummy_transaction_log_class}

  before :each do
    allow(dummy_transaction_log_class).to receive(:new) do |date, amount, bal|
      date.strftime '%d' + ( amount.positive? ? 'test deposit' : 'test withdrawal')
    end
  end

  describe '#deposit' do

    it 'creates a new deposit transaction with the new balance' do
      test_account.deposit Date.new(1970,1,1), 100
      expect(dummy_transaction_log_class).to have_received(:new).with Date.new(1970,1,1), 100, 100
    end

  end

  describe '#withdraw' do

    it 'creates a new withdraw transaction with the new balance' do
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

    it 'returns a string with the deposit transaction' do
      expect(test_account.print_statement).to include DEPOSIT_STRING
    end

    it 'returns a string with the withdrawal transaction' do
      expect(test_account.print_statement).to include WITHDRAW_STRING
    end

    it 'returns the transactions in the right order' do
      expect(test_account.print_statement).to include WITHDRAW_STRING + '\n' + DEPOSIT_STRING
    end

  end

end
