require "account"

describe Account do
  let(:transaction) { double :transaction, date: "17/06/2016" }
  let(:transaction_class) { double :transaction_class, new: transaction}

  subject(:account) { described_class.new(transaction_class) }

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
