require "account"

describe Account do

  it "initialises with a balance of 0" do
    expect(subject.balance).to eq(0)
  end

  it "initialises with an empty date" do
    expect(subject.transaction).to be_empty
  end

  it "displays the date and credits the account" do
    subject.credit(500, "12/03/16")
    expect(subject.balance).to eq(500)
    expect(subject.transaction).to eq([["12/03/16", 500, 500]])
  end

  it "displays the date and debits the account" do
    subject.credit(500, "12/03/16")
    subject.debit(300, "13/03/16")
    expect(subject.balance).to eq(200)
    expect(subject.transaction).to include(["13/03/16", 300, 200])
  end

end
