require 'statement.rb'

describe Statements do
  subject(:statements) {described_class.new}

  it "starts out empty" do
    expect(statements.collection).to be_empty
  end

  it "stores formated balance " do
    statements.create_statement(balance: 100, withdraw: 10)
    expect(statements.collection.first[:balance]).to eq 100
  end

  it "stores formated withdraw " do
    statements.create_statement(balance: 100, withdraw: 0)
    expect(statements.collection.first[:withdraw]).to eq 0
  end

  it "stores formated deposit " do
    statements.create_statement(balance: 100, deposit: 10)
    expect(statements.collection.first[:deposit]).to eq 10
  end

  it "calls a date format " do
    statements.create_statement(balance: 100, withdraw: 10)
    expect(statements.collection.first[:time]).to eq (Time.now.strftime('%D'))
  end
end