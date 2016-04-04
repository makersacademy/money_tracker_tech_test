require 'statement.rb'

describe Statements do
  subject(:statements) {described_class.new}

  it "starts out empty" do
    expect(statements.print).to be_empty
  end

  it "formats money correctly" do
    expect(statements.format(20)).to eq "20.00"
  end

  xit "adds formatted information to the collection" do
    statements.create(balance: 100, credit: 10)
    expect(statements.print.first[:balance]).to eq "100.00"
  end

end