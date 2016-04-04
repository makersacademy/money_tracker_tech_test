require "./lib/account.rb"

describe Account do
  subject(:account) {described_class.new}

  describe "#initialize" do

    it "initializes a new account with a balance of 0" do
      expect(account.show_balance).to eq 0
    end

  end

  context "makeing a deposit to the account" do

    describe "#deposit" do

      it "adds the amount deposited to the balance" do
        account.deposit(5.00)
        expect(account.show_balance).to eq 5.00
      end

    end

  end

  context "making a withdrawal from the account" do

    describe "#withdrawal" do

      it "subtracts the amount withdrawn from the balance" do
        account.withdraw(5.00)
        expect(account.show_balance).to eq -5.00
      end

    end

  end

end
