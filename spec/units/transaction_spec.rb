require 'transaction'

describe Transaction do
  let(:dummy_amount) {1000}
  subject(:deposit_transaction) {described_class.new(dummy_amount, :deposit, dummy_client_account)}
  subject(:withdrawal_transaction) {described_class.new(dummy_amount, :withdrawal, dummy_client_account)}
  let(:dummy_client_account) {double :dummy_client_account}

  describe '#initialize' do

    before do
      Timecop.freeze(Time.local(1990, 1, 2, 13, 05))
    end

    after do
      Timecop.return
    end

    it 'is initialized with the current date to record transaction' do
      expect(deposit_transaction.date).to eq(Time.now)
    end

    it 'is initialized with the client\'s account' do
      expect(deposit_transaction.client_account).to eq(dummy_client_account)
    end

    it 'is initialized with the type of deposit_transaction it is' do
      expect(deposit_transaction.type).to eq(:deposit)
      expect(withdrawal_transaction.type).to eq(:withdrawal)

    end

  end

  describe '#make' do
    before do
      allow(dummy_client_account).to receive(:balance)
    end

    xit 'changes the clients account balance' do
      expect{deposit_transaction.make}.to change(dummy_client_account, :balance).by(dummy_amount)
    end

  end

  describe '#record' do

  before do
    allow(dummy_client_account).to receive(:history).and_return(Array.new)
  end

    it 'appends itself to the client account\'s history' do
      expect(dummy_client_account).to receive(:history)
      deposit_transaction.record
    end
  end
end
