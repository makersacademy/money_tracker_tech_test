require 'statement.rb'

describe Statements do
  subject(:statements) {described_class.new}

  it "starts out empty" do
    expect(statements.print).to be_empty
  end

  it "creates a statement " do
    statements.create_statement(balance: 100, withdraw: 10)
    expect(statements.print.first[:balance]).to eq "100.00"
  end

  it "calls a date format " do
    statements.create_statement(balance: 100, withdraw: 10)
    expect(statements.print.first[:time]).to eq (Time.now.strftime('%D'))
  end
end