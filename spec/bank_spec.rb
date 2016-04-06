describe Bank do

  it {is_expected.to be}
  it {is_expected.to respond_to(:balance)}
  it {is_expected.to respond_to(:deposit).with(1).argument}
  it {is_expected.to respond_to(:withdraw).with(1).argument}

  describe ".balance" do
    my_account = Bank.new
    it "has a starting balance of zero dollars" do
      expect(my_account.balance).to eq(0)
    end
  end

  describe ".deposit" do
    it "adds money to the bank account" do
      my_account = Bank.new
      expect{my_account.deposit(100)}.to change {my_account.balance}.by(100)
    end
  end

  describe ".withdraw" do
    it "removes money from the bank account" do
      my_account = Bank.new
      expect{my_account.withdraw(100)}.to change {my_account.balance}.by(-100)
    end
  end
end