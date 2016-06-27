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
      account.deposit(1000)
      expect(account.get_balance).to eq(1000)
    end
  end

end
