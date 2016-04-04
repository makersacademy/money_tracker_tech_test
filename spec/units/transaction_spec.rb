require 'transaction'

describe Transaction do
  let(:dummy_amount) {1000}
  let(:dummy_balance) {100}
  let(:dummy_client_account) {double :dummy_client_account}
  subject(:deposit_transaction) {described_class.new(dummy_amount, :credit, dummy_client_account)}
  subject(:withdrawal_transaction) {described_class.new(dummy_amount, :debit, dummy_client_account)}

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
      expect(deposit_transaction.client_balance).to eq(dummy_client_account)
    end

    it 'is initialized with the type of deposit_transaction it is' do
      expect(deposit_transaction.type).to eq(:credit)
      expect(withdrawal_transaction.type).to eq(:debit)

    end

  end

  describe '#make' do
    before do
      allow(dummy_client_account).to receive(:balance).and_return(dummy_balance)
      allow(dummy_balance).to receive(:balance).with(dummy_amount)
    end

    xit 'changes the clients account balance, adding when deposit transaction' do
      deposit_transaction.make
      expect(dummy_client_account.balance).to eq(dummy_balance + dummy_amount)
    end

  end


end
