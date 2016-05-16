require_relative '../lib/bank'

describe Bank do

  subject(:bank) { described_class.new }

  let(:transaction1) { double(:transaction, date: '10/01/2012', amount: -1000, balance: -1000) }
  let(:transaction2) { double(:transaction, date: '15/01/2012', amount: 2500, balance:  1500) }
  let(:history) { [transaction1, transaction2] }

  let(:empty_account) { double(:account, balance: 0, history: []) }
  let(:used_account) { double(:account, balance: 1500, history: history) }

  describe '#print_statement' do
    it 'prints out a statement with date, credit, deposit and balance' do
      colums = 'date || credit || debit || balance'
      expect(bank.print_statement(empty_account).include?(colums)).to eq true
    end

    it 'prints out a statement with date, credit, deposit and balance' do
      statement = bank.print_statement(used_account)
      expect(statement.include?('10/01/2012' && '-1000' && '15/01/2012' && '2500')).to eq true
    end
  end
end
