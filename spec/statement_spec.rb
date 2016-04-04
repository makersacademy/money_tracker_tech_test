require 'statement'

describe Statement do

  subject(:statement) {described_class.new}

  it 'has a empty record of credits' do
    expect(statement.credits).to eq({})
  end

  it 'has a empty record of debits' do
    expect(statement.debits).to eq({})
  end

end
