require './lib/bank'

describe Bank do

  subject(:bank) { described_class.new(statement_class: statement_class) }

  let(:statement_class) { double(:statement_class, new: statement) }
  let(:statement) { double(:statement, format_transaction: "10/01/2012 -1000 15/01/2012 2500")}

  let(:used_account) { double(:account, balance: 1500, history: nil) }

  describe '#print_statement' do
    it 'instantiate a statement object with an account history' do
      bank.print_statement(used_account)
      expect(statement_class).to have_received(:new)
    end
    it 'prints out a statement with date, credit, deposit and balance' do
      statement = bank.print_statement(used_account)
      expect(statement.include?('10/01/2012' && '-1000' && '15/01/2012' && '2500')).to eq true
    end
  end
end
