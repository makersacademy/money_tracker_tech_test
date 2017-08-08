require './lib/statement.rb'

describe Statement do
  let(:my_ledger) { double(:ledger) }
  let(:my_record) { double(:record, amount: 250, date: '05/08/2017', type: :credit) }

  subject(:statement) { described_class.new(my_ledger) }

  describe '#attributes' do
    it 'initializes with a new ledger' do
      expect(statement.ledger).to eq(my_ledger)
    end

    it 'initializes with an empty formatted transactions array' do
      expect(statement.formatted_transactions).to eq([])
    end
  end

  describe '#print_statement' do
    it 'prints each transaction as a string' do
      allow(my_ledger).to receive(:transactions).and_return([my_record])
      expect { statement.print_statement }.to output("date || credit || debit || balance\n05/08/2017 || 250 ||   || 250\n").to_stdout
    end
  end
end
