require "./lib/account.rb"

describe Account do
  subject(:account) {described_class.new}

  before do
    allow(account).to receive(:todays_date).and_return("4/4/2016")
  end

  describe "#initialize" do

    it "initializes a new account with a balance of 0" do
      expect(account.show_balance).to eq "0.00"
    end

  end

  context "makeing a deposit to the account" do

    describe "#deposit" do

      it "adds the amount deposited to the balance" do
        account.make_deposit(5.00)
        expect(account.show_balance).to eq "5.00"
      end

      # it "saves the date a deposit is made to the history array" do
      #   account.make_deposit(5.0)
      #   expect(account.show_statement).to eq [{amount: 5.0, date: "4/4/2016"}]
      # end

    end

  end

  context "making a withdrawal from the account" do

    describe "#withdrawal" do

      it "subtracts the amount withdrawn from the balance" do
        account.make_withdrawal(5.00)
        expect(account.show_balance).to eq "-5.00"
      end

      # it "saves the date a withdrawal is made to the history array" do
      #   account.make_withdrawal(-5.0)
      #   expect(account.show_statement).to eq [{amount: -5.0, date: "4/4/2016"}]
      # end

    end

  end

  context "display statement history" do

    describe "#show_statement" do

      it "properly displays the history after a deposit of 5.00 is made" do
        account.make_deposit(5.00)
        expect(account.show_statement).to eq ["Date || Credit || Debit || Balance", "4/4/2016 || 5.00 ||  || 5.00"]
      end

      it "properly displays the history after a withdrawal of 5.00 is made" do
        account.make_withdrawal(5.00)
        expect(account.show_statement).to eq ["Date || Credit || Debit || Balance", "4/4/2016 ||  || 5.00 || -5.00"]
      end

      it "records and properly displays the history of multiple transactions" do
        account.make_deposit(5.00)
        account.make_withdrawal(5.00)
        expect(account.show_statement).to eq ["Date || Credit || Debit || Balance", "4/4/2016 || 5.00 ||  || 5.00", "4/4/2016 ||  || 5.00 || 0.00"]
      end

    end

  end




end
