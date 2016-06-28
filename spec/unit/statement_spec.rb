require 'statement'

describe Statement do
  subject(:statement) { described_class.new }

  context 'deposits' do
    it 'adds a new line to the statement' do
      statement.add_entry('Amount', 'Balance')
      expect(statement.print).to include 'Amount'
      expect(statement.print).to include 'Balance'
    end
  end

  context 'withdrawls' do
    it 'adds a new line to the statement' do

    end
  end
end
