require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  let(:full_statement) { "date || credit || debit || balance\n
                          14/01/2012 || || 500.00 || 2500.00\n
                          13/01/2012 || 2000.00 || || 3000.00\n
                          10/01/2012 || 1000.00 || || 1000.00" }
  it 'prints a statement in reverse chronological order' do
    expect(statement.show).to eq full_statement
  end
end
