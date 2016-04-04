require 'statement.rb'

describe Statement do
  subject(:statement) {described_class.new}

  it "starts out empty" do
    expect(statement.collection).to be_empty
  end

  it "returns a no statements message if emtpy" do
    expect(statement.print).to eq "No statements available"
  end

  it "stores formated balance " do
    statement.add_transaction(balance: 100, withdraw: 10)
    expect(statement.collection.first).to eq({:balance=>"100.00", :deposit=>"", :withdraw=>"10.00", :time=>Time.now.strftime('%D')})
  end
end