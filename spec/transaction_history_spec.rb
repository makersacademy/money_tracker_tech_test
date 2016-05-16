require 'transaction_history'

describe TransactionHistory do

  let(:transaction){ double :transaction }
  let(:transaction_class){double :transaction_class, new: transaction}
  subject(:transaction_history) {described_class.new(transaction_class: transaction_class)}

  describe '#deposit' do
    it 'creates a transaction' do
      expect(transaction_class).to receive(:new).with('10/01/2012', 1000.00, 1000.00)
      transaction_history.deposit('10/01/2012', 1000.00, 1000.00)
    end

    it 'records transaction' do
      allow(transaction_class).to receive(:new).and_return transaction
      transaction_history.deposit('10/01/2012', 1000.00, 1000.00)
      expect(transaction_history.transactions).to include transaction
    end
  end

  describe '#withdraw' do
    it 'creates a transaction' do
      expect(transaction_class).to receive(:new).with('10/01/2012', -1000.00, 0)
      transaction_history.withdraw('10/01/2012', 1000.00, 0)
    end

    it 'records transaction' do
      allow(transaction_class).to receive(:new).and_return transaction
      transaction_history.withdraw('10/01/2012', 1000.00, 0)
      expect(transaction_history.transactions).to include transaction
    end
  end

  describe '#print' do
    it 'prints transactions' do
      expect{ transaction_history.print_statement }.to output.to_stdout
    end
  end

end
