require "account"

describe Account do
  subject(:account) { described_class.new }

  it "can make a deposit" do
    account.deposit(1000)
    expect(account.get_balance).to eq(1000)
  end

end
