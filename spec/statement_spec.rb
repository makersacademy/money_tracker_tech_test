require 'statement'

describe Statement do

  subject(:statement) {described_class.new}

  it 'has a empty record of transactions' do
    expect(statement.transactions).to eq []
  end

end
