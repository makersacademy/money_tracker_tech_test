
describe TransactionsLog do
  let(:transaction_class) { double('Transaction') }
  subject(:transactionslog) { described_class.new(transaction_class) }

  let(:current_balance) { 100 }
  let(:amount) { 10 }

  describe '#withdraw' do

    let(:transaction) { double('Transaction', time: '10/10/2017', debit: amount, credit: 0, balance: current_balance) }

    before do
      allow(transaction_class).to receive(:new).and_return(transaction)
    end

    it 'will instaniate a new transaction' do
      expect(transaction_class).to receive(:new).with(debit: amount, balance: current_balance)
      transactionslog.withdraw(current_balance, amount)
    end

    it 'will add a transaction to history' do
      expect { transactionslog.withdraw(current_balance, amount) }.to change { transactionslog.history }.from([]).to([transaction])
    end

  end

  describe '#deposit' do

    let(:transaction) { double('Transaction', timestamp: '10/10/2017', debit: 0, credit: amount, balance: current_balance) }

    before do
      allow(transaction_class).to receive(:new).and_return(transaction)
    end

    it 'will instantiate a new transaction' do
      expect(transaction_class).to receive(:new).with(credit: amount, balance: current_balance)
      transactionslog.deposit(current_balance, amount)
    end

    it 'will log a transaction' do
      expect { transactionslog.deposit(current_balance, amount) }.to change { transactionslog.history }.from([]).to([transaction])
    end
    
  end
end
