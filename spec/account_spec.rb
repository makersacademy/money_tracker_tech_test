require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe "#initialize" do
    it "takes a default value of zero" do
      expect(account.get_balance).to eq(0)
    end
  end

  describe "#deposit" do
    it "increases the account balance" do
      account.deposit(1000, "17/06/2016")
      expect(account.get_balance).to eq(1000)
    end
  end

  describe "#withdraw" do
    it "decreases the account balance" do
      account.withdraw(1000, "17/06/2016")
      expect(account.get_balance).to eq(-1000)
    end
  end

  it "stores transaction history" do
    account.withdraw(1000, "17/06/2016")
    expect(account.get_transaction_history.first.date).to eq("17/06/2016")
  end

end
