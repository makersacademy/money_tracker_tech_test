require_relative '../lib/bank'

describe Bank do

  subject(:bank) { described_class.new }
  let(:empty_account) { double(:account, balance: 0) }

  describe '#print_statement' do
    it 'prints out a statement with date, credit, deposit and balance' do
      colums = 'date || credit || debit || balance'
      expect(bank.print_statement(empty_account).include?(colums)).to eq true
    end
  end
end
