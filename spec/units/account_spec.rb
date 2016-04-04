require 'account'

describe Account do
  subject(:account_klass) {described_class}
  let(:dummy_transaction_klass) {double :dummy_transaction_klass}
  let(:dummy_statement_klass) {double :dummy_statement_klass}
  let(:dummy_statement) {double :dummy_statement}
  let(:dummy_transaction) {double :dummy_transaction}
  let(:dummy_amount) {double :dummy_amount}
  subject(:account) {described_class.new}

  describe '#initialize' do

    it 'has a new history when the account is initialized' do
      expect(account.history).to be_empty
    end

    it 'instantiates with a balance of 0 as a default' do
      expect(account.balance).to be_zero
    end

  end

  describe '#new_action' do

    before do
      allow(dummy_transaction_klass).to receive(:new)
                                    .with(dummy_amount, :deposit, account.balance)
                                    .and_return(dummy_transaction)
      allow(dummy_transaction).to receive(:make)
    end

    it 'calls make on a new instance of action, defaulting to Transaction' do
      expect(dummy_transaction).to receive(:make)
      account.new_action(dummy_amount, :deposit, dummy_transaction_klass)
    end

    it 'calls record to store the recent action to the account history' do
      expect(account).to receive(:record).with(dummy_transaction)
      account.new_action(dummy_amount, :deposit, dummy_transaction_klass)
    end


  end

  describe '#record' do

    it 'appends itself to the client account\'s history' do
      account.record(dummy_transaction)
      expect(account.history).to eq([dummy_transaction])
    end
  end

  describe 'compile_statement' do

    before do
      allow(dummy_statement_klass).to receive(:new).and_return(dummy_statement)
      allow(dummy_statement).to receive(:full_print_statement)
    end

    it 'instantiates a new statement class with the account history' do
      expect(dummy_statement_klass).to receive(:new).with(account.history)
      account.compile_statement(:descending, dummy_statement_klass)
    end

    it 'calls full print statement on an instance of new statement' do
      expect(dummy_statement).to receive(:full_print_statement)
      account.compile_statement(:ascending, dummy_statement_klass)
    end
  end
end
