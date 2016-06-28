require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:make_deposit) { account.deposit(1000, "17/06/2016") }
  let(:make_withdrawal) { account.withdraw(1000, "17/06/2016") }

  describe "#initialize" do
    it "takes a default value of zero" do
      expect(account.balance).to eq(0)
    end
  end

  describe "#deposit" do
    it "increases the account balance" do
      make_deposit
      expect(account.balance).to eq(1000)
    end
  end

  describe "#withdraw" do
    it "decreases the account balance" do
      make_withdrawal
      expect(account.balance).to eq(-1000)
    end
  end

  it "stores transaction history" do
    make_withdrawal
    expect(account.transaction_history.first.date).to eq("17/06/2016")
  end

end
