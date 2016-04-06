describe Bank do
  subject {described_class .new}

  it {is_expected.to be}
  it {is_expected.to respond_to(:balance)}
  it {is_expected.to respond_to(:deposit).with(2).arguments}
  it {is_expected.to respond_to(:withdraw).with(2).arguments}
  it {is_expected.to respond_to(:statement)}

  describe ".balance" do
    it "has a starting balance of zero dollars" do
      expect(subject.balance).to eq(0)
    end
  end

  describe ".deposit" do
    it "adds money to the bank account" do
      expect{subject.deposit(100)}.to change {subject.balance}.by(100)
    end
  end

  describe ".withdraw" do
    it "removes money from the bank account" do
      expect{subject.withdraw(100)}.to change {subject.balance}.by(-100)
    end
  end

  describe ".statement" do
    it "displays the current balance after each transaction" do
      subject.deposit(100)
      subject.withdraw(100)
      expect(subject.statement.first).to match(/Balance:100/)
      expect(subject.statement.last).to match(/Balance:0/)
    end

    it "displays the date of each transaction" do
      subject.deposit(100, "04/01/2016")
      subject.withdraw(100,"04/02/2016")
      expect(subject.statement.first).to match(/Date:04\/01\/2016/)
      expect(subject.statement.last).to match(/Date:04\/02\/2016/)
    end

    context "after a deposit" do
      it "shows the deposit amount" do
        subject.deposit(100)
        expect(subject.statement.last).to match(/Deposit:100/)
      end
    end

    context "after a withdrawal" do
      it "shows the withdrawal amount" do
        subject.withdraw(100)
        expect(subject.statement.last).to match(/Withdrawal:100/)
      end
    end  
  end
end