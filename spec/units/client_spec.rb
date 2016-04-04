require 'client'

describe Client do
  subject(:client_klass) {described_class}
  subject(:client) {described_class.new(dummy_account_klass)}
  let(:dummy_account_klass) {double :dummy_account_klass}
  let(:dummy_account) {double :dummy_account}
  let(:dummy_transaction) {double :dummy_transaction}
  let(:dummy_withdrawal) {double :dummy_withdrawal}
  let(:dummy_deposit) {double :dummy_deposit}


  #MAGIC NUMBERS
  let(:large_transaction) {1000}


  describe '#initialize' do

    before do
      allow(dummy_account_klass).to receive(:new)
    end

    it 'is initialized with a new account' do
      expect(dummy_account_klass).to receive(:new)
      client_klass.new(dummy_account_klass)
    end

  end

  describe '#deposit' do

    before do
      allow(dummy_account_klass).to receive(:new).and_return(dummy_account)
      allow(dummy_account).to receive(:new_action)
      allow(dummy_account).to receive(:balance=)
    end

    after do
      client.deposit(large_transaction)
    end

    it 'instantiates a new transaction for the client on their account' do
      expect(dummy_account).to receive(:new_action)
                           .with(large_transaction, :credit)

    end


  end

  describe '#withdraw' do

    before do
      allow(dummy_account_klass).to receive(:new).and_return(dummy_account)
      allow(dummy_account).to receive(:new_action)
      allow(dummy_account).to receive(:balance=)
    end

    after do
      client.withdraw(large_transaction)
    end

    it 'instantiates a new transaction associated with the client\'s account' do
      expect(dummy_account).to receive(:new_action)
                           .with(large_transaction, :debit)
    end

  end

  # describe '#show_statement' do
  #
  #   before do
  #     allow(dummy_account_klass).to receive(:new).and_return(dummy_account)
  #     allow(dummy_account).to receive(:new_action)
  #     allow(dummy_account).to receive(:history).and_return([dummy_transaction])
  #     allow(dummy_transaction).to receive(:date)
  #     allow(dummy_transaction).to receive(:amount)
  #   end
  #
  #   it 'retrieves the account history' do
  #     expect(dummy_account).to receive(:history)
  #     client.show_statement
  #   end
  # end
end
