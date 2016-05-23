require 'statement'

describe Statement do
  subject(:statement) { described_class.new }

  it 'initialises with an empty array of transactions' do
    expect(statement.transactions).to eq []
  end

end
