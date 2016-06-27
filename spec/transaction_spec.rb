require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(1000, "17/06/2016") }

  it "stores a date" do
    expect(transaction.date).to eq("17/06/2016")
  end

  it "stores a value" do
    expect(transaction.value).to eq(1000)
  end

end
