require "./lib/account.rb"

describe Account do
subject(:account) {described_class.new}


  describe "#initialize" do
    it "customer has a balance of £0" do
      expect(account.balance).to eq 0
    end

    it "creates a new transaction list which is blank on initialization" do
      expect(account.history).to eq []
    end
  end

  describe "#deposit" do
    it "adds the specified amount to the balance" do
      expect{ account.deposit(50) }.to change{ account.balance }.by(50)
    end

    it "adds a new transaction to the list" do
      expect{ account.deposit(50) }.to change{ account.history.length }.by(1)
    end

  end

  describe "#withdraw" do
    it "subtracts the specified amount from the balance" do
      account.deposit(50)
      expect{ account.withdraw(10) }.to change{ account.balance }.by(-10)
    end

    it "adds a new transaction to the list" do
      account.deposit(50)
      expect{ account.withdraw(10) }.to change{ account.history.length }.by(1)
    end
  end

  describe "#print_statement" do
    it "displays the previous transactions" do
      account.deposit(50, Time.new(2012, 01, 10))
      account.withdraw(10, Time.new(2012, 01, 14))
      expect(account.print_statement).to eq "date || credit || debit || balance
      14/01/2012 || || 10.00 || 40.00
      10/01/2012 || || 50.00 || 50.00"
    end
  end

end
