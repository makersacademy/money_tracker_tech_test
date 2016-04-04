require 'statement.rb'

describe Statements do
  subject(:statements) {described_class.new}

  it "starts out empty" do
    expect(statements.collection).to be_empty
  end

  it "returns a no statements message if emtpy" do
    expect(statements.print).to eq "No statements available"
  end

  it "stores formated balance " do
    statements.add_transaction(balance: 100, withdraw: 10)
    expect(statements.collection.first).to eq({:balance=>"100.00", :deposit=>"", :withdraw=>"10.00", :time=>Time.now.strftime('%D')})
  end
end