require "./lib/account.rb"

describe Account do
subject(:account) {described_class.new(statement)}
let(:statement) { double :statement }

  before do
    allow(statement).to receive(:new_transaction)
  end

  describe "#initialize" do
    it "customer has a balance of £0" do
      expect(account.balance).to eq 0
    end
  end

  describe "#deposit" do
    it "adds the specified amount to the balance" do
      expect{ account.deposit(50) }.to change{ account.balance }.by(50)
    end

    it "calls for a new transaction to be added to the statement" do
      expect(statement).to receive(:new_transaction).with(50, 0, Time.new(2012, 01, 10))
      account.deposit(50, Time.new(2012, 01, 10))
    end

  end

  describe "#withdraw" do
    it "subtracts the specified amount from the balance" do
      account.deposit(50)
      expect{ account.withdraw(10) }.to change{ account.balance }.by(-10)
    end


    it "calls for a new transaction to be added to the statement" do
      expect(statement).to receive(:new_transaction).with(0, 10, Time.new(2012, 01, 10))
      account.withdraw(10, Time.new(2012, 01, 10))
    end
  end

  describe "#print_statement" do
    it "calls for the statement to be printed" do
      expect(statement).to receive(:print)
      account.print_statement
    end
  end

end
