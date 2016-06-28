require "account"

describe Account do
  subject(:account) { described_class.new }
  let(:make_deposit) { account.deposit(1000, "17/06/2016") }
  let(:make_withdrawal) { account.withdraw(1000, "17/06/2016") }

  it "can make a deposit" do
    make_deposit
    expect(account.balance).to eq(1000)
  end

  it "can make a withdrawal" do
    make_withdrawal
    expect(account.balance).to eq(-1000)
  end

  it "stores transaction date" do
    make_deposit
    expect(account.transaction_history[0].date).to eq("17/06/2016")
  end
end
