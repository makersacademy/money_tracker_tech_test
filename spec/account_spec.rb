require_relative '../lib/account'

describe Account do

  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'initializes with a balance of zero' do
      expect(account.balance).to eq 0
    end

    it 'initializes with an empty history' do
      expect(account.history).to eq []
    end
  end

  describe '#print_statement' do
    it 'prints out a statement with date, credit, deposit and balance' do
      colums = 'date || credit || debit || balance'
      expect(account.print_statement.include?(colums)).to eq true
    end
  end
end
