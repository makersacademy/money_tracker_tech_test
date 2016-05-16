require 'transaction_log'

describe TransactionLog do
  let(:transaction1) { double(:transaction, date: DateTime.new(2012,01,14), total_credit: 0, total_debit: 500, total: -500) }
  let(:transaction2) { double(:transaction, date: DateTime.new(2012,01,13), total_credit: 2000, total_debit: 0, total: 2000) }
  let(:transaction3) { double(:transaction, date: DateTime.new(2012,01,10), total_credit: 1000, total_debit: 0, total: 1000) }


  describe '#initialize' do
    it 'starts with an empty history' do
      expect(subject.transactions).to be_empty
    end
  end

  describe '#add_new' do
    it { is_expected.to respond_to(:add_new).with(1).argument }
    it 'adds a transaction to the transaction history' do
      subject.add_new(transaction1)
      expect(subject.transactions).to eq [transaction1]
    end
  end

  describe '#calculate_total' do
    it 'calculates the total of all credits and debits in transaction log' do
      subject.add_new(transaction1)
      subject.add_new(transaction2)
      subject.add_new(transaction3)
      expect(subject.total).to eq 2500
    end
  end

  describe '#print_statement' do
    it 'should print a neatly formatted statement of all transactions' do
      subject.add_new(transaction1)
      subject.add_new(transaction2)
      subject.add_new(transaction3)
      statement = "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
      expect{ subject.print_statement }.to output(statement).to_stdout
    end
  end
end
