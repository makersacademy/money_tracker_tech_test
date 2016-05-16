require './lib/statement'

describe Statement do

  subject(:statement) { described_class.new }
  
  let(:transaction1) { double(:transaction, date: '10/01/2012', amount: -1000, balance: -1000) }
  let(:transaction2) { double(:transaction, date: '15/01/2012', amount: 2500, balance:  1500) }
  let(:history) { [transaction1, transaction2] }

  describe '#initialize' do
    it 'is initialized with a header template' do
      expect(statement.header).to eq "date || credit || debit || balance\n"
    end
    it 'is initialized with an empty body' do
      expect(statement.body).to eq ''
    end
  end

  describe '#format_transaction' do
    it 'creates a record containing date, credit, deposit and balance' do
      statement.format_transaction(history)
      expect(statement.body.include?('10/01/2012' && '-1000' && '15/01/2012' && '2500')).to eq true
    end
  end
end
