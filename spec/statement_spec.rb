require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  let(:transaction) {[{date:"10/01/2012", amount: 1000, balance: 1000},
                      {date:"13/01/2012", amount:2000.0, balance: 3000},
                      {date:"14/01/2012", amount:-500.0, balance: 2500}]}
  let(:full_statement) { "date || credit || debit || balance\n" +
                         "14/01/2012 || || 500.00 || 2500.00\n" +
                         "13/01/2012 || 2000.00 || || 3000.00\n" +
                         "10/01/2012 || 1000.00 || || 1000.00" }

  it 'prints a statement in reverse chronological order' do
    expect(statement.show(transaction)).to eq full_statement
  end
end
