describe MoneyTracker do

  let(:money_tracker) { MoneyTracker.new }

  it { is_expected.to respond_to(:credit).with(1).arguments }

  it "initialises with a balance of 0" do
    expect(money_tracker.balance).to eq 0
  end

  describe "#credit" do
    before do
      money_tracker.credit(50)
    end

    it "can add credit to the balance" do
      expect(money_tracker.balance).to eq 50
    end

    it "can store date credit was made" do
      expect(money_tracker.credits).to eq [{ Date.today.strftime("%m/%d/%Y") => 50 }]
    end
  end

  describe "#debit" do
    before do
      money_tracker.credit(50)
      money_tracker.debit(10)
    end

    it "can deduct credit from the balance" do
      expect(money_tracker.balance).to eq 40
    end

    it "can store date debit was made" do
      expect(money_tracker.debits).to eq [{ Date.today.strftime("%m/%d/%Y") => 10 }]
    end
  end
end
