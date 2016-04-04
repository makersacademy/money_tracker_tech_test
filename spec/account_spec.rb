require 'account.rb'

describe Account do
  subject(:account) {described_class.new}

  it "starts with a balance of 0" do
    expect(account.balance).to eq 0
  end

  describe "balance > 0" do
    before(:each) do 
      account.deposit(100)
    end

    it "adds to balance correctly after a deposit is made" do
      expect(account.balance).to eq 100
    end

    it "deducts from balance correctly after a deposit is made" do
      account.withdraw(20)
      expect(account.balance).to eq 80
    end

    it "doesn't deduct more than available in the balance" do
      expect{account.withdraw(110)}.to raise_error "You can only withdraw #{account.balance}."
    end

  end
end