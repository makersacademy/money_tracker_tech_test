require 'account'

describe Account do
  it "has a starting balance of 0" do
    expect(subject.balance).to eq(0)
  end

  it "can make a deposit" do
    subject.deposit(10)
    expect(subject.balance).to eq(10)
  end
end
