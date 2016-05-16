describe Transaction do

  subject(:transaction) { described_class.new(10, "16/05/16") }

  it "should initialize with an amount given" do
    expect(transaction.amount).to eq 10
  end

  it "should initialize with a date" do
    expect(transaction.date).to eq "16/05/16"
  end

end
