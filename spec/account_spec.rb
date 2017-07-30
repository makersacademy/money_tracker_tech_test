require 'account'

describe Account do
  it "has a starting balance of 0" do
    expect(subject.balance).to eq(0)
  end

  it "can make a deposit" do
    subject.deposit(10)
    expect(subject.balance).to eq(10)
  end

  it "can make a withdraw" do
    subject.deposit(10)
    subject.withdraw(5)
    expect(subject.balance).to eq(5)
  end
end
