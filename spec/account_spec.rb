require 'account'

describe Account do
  it "has a starting balance of 0" do
    expect(subject.balance).to eq(0)
  end
end
