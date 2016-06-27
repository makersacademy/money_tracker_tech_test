require "account"

describe Account do
  subject(:account) { described_class.new }

  it "can make a deposit" do
    account.deposit(1000, "17/06/2016")
    expect(account.get_balance).to eq(1000)
  end

  it "can make a withdrawal" do
    account.withdraw(1000, "17/06/2016")
    expect(account.get_balance).to eq(-1000)
  end

  it "stores transaction date" do
    account.deposit(1000, "17/06/2016")
    expect(account.get_transaction_history[0].date).to eq("17/06/2016")
  end
end
