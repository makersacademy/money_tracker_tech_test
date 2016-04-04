require 'client'

describe Client do
  subject(:client_klass) {described_class}
  subject(:client) {described_class.new(dummy_account_klass)}
  let(:dummy_account_klass) {double :dummy_account_klass}
  let(:dummy_account) {double :dummy_account}
  let(:dummy_transaction_klass) {double :dummy_transaction_klass}

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
      allow(dummy_transaction_klass).to receive(:new).with(anything)
    end

    after do
      client.deposit(large_transaction, dummy_transaction_klass)
    end

    it 'instantiates a new transaction for the client with amount and type' do
      expect(dummy_transaction_klass).to receive(:new)
                                     .with(large_transaction, client, :deposit)
    end

  end

  describe '#withdraw' do

    before do
      allow(dummy_account_klass).to receive(:new).and_return(dummy_account)
      allow(dummy_transaction_klass).to receive(:new).with(anything)
    end

    after do
      client.withdraw(large_transaction, dummy_transaction_klass)
    end

    it 'instantiates a new transaction associated with the client' do
      expect(dummy_transaction_klass).to receive(:new)
                                     .with(large_transaction, client, :withdrawal)
    end

  end
end
