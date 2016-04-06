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
      expect(subject.statement.first[:balance]).to eq(100)
      expect(subject.statement.last[:balance]).to eq(0)
    end

    it "displays the date of each transaction" do
      subject.deposit(100, "04/01/2016")
      subject.withdraw(100,"04/02/2016")
      expect(subject.statement.first[:date]).to eq("04/01/2016")
      expect(subject.statement.last[:date]).to eq("04/02/2016")
    end

    context "after a deposit" do
      it "shows the deposit amount" do
        subject.deposit(100)
        expect(subject.statement.last[:credit]).to eq(100)
      end
    end

    context "after a withdrawal" do
      it "shows the withdrawal amount" do
        subject.withdraw(100)
        expect(subject.statement.last[:debit]).to eq(100)
      end
    end  
  end

  describe ".print_statement" do
    it "prints a log of account activity" do
      subject.deposit(100, "04/01/2016")
      subject.withdraw(50, "04/02/2016")
      subject.deposit(1000, "04/03/2016")
      subject.withdraw(500, "04/04/2016")
      expect(subject.print_statement[0]).to include(date: "04/01/2016", credit:100, balance:100)
      expect(subject.print_statement[3]).to include(date: "04/04/2016", debit:500, balance:550)
    end
  end
end