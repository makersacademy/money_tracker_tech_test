require 'transaction'

describe Transaction do
  it "has a an amount" do
    expect(subject.amount).to eq(0)
  end
end
