require 'transaction'

describe Transaction do
  let(:dummy_amount) {1000}
  let(:dummy_balance) {100}
  let(:dummy_client_balance) {double :dummy_client_balance}
  subject(:deposit_transaction) {described_class.new(dummy_amount, :credit, dummy_client_balance)}
  subject(:withdrawal_transaction) {described_class.new(dummy_amount, :debit, dummy_client_balance)}

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
      expect(deposit_transaction.client_balance).to eq(dummy_client_balance)
    end

    it 'is initialized with the type of deposit_transaction it is' do
      expect(deposit_transaction.type).to eq(:credit)
      expect(withdrawal_transaction.type).to eq(:debit)

    end

  end

  describe '#make' do

    before do
      allow(deposit_transaction.client_balance).to receive(:+)
      allow(withdrawal_transaction.client_balance).to receive(:-)

    end

    it 'checks if the transaction is a credit (or debit)' do
      expect(deposit_transaction).to receive(:credit?).and_return(true)
      deposit_transaction.make
    end

    it 'checks if the transaction is a debit (or credit)' do
      expect(withdrawal_transaction).to receive(:credit?).and_return(false)
      withdrawal_transaction.make
    end

    it 'changes the clients account balance, adding when deposit transaction' do
      expect(deposit_transaction.make).to eq(dummy_client_balance + dummy_amount)
    end

  end


end
