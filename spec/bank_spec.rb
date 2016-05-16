require 'bank_account'

HEADERS = 'date || credit || debit || balance'

describe BankAccount do
  let(:dummy_transaction_log_class) { double :TransactionLog, new: nil}
  subject(:test_account) { described_class.new dummy_transaction_log_class}

  describe '#print_statement' do

    it 'returns a string with the right headers' do
      expect(test_account.print_statement).to include HEADERS
    end

  end

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

end
