describe MoneyTracker do

  let(:money_tracker) { MoneyTracker.new }

  it { is_expected.to respond_to(:credit).with(2).arguments }

  it "initialises with a balance of 0" do
    expect(money_tracker.balance).to eq 0
  end

  describe "#credit" do
    before do
      money_tracker.credit(50,'07/08/17')
    end

    it "can add credit to the balance" do
      expect(money_tracker.balance).to eq 50
    end

    it "can store date credit was made" do
      expect(money_tracker.credits).to eq [{"07/08/17" => 50.0}]
    end
  end

  describe "#debit" do
    before do
      money_tracker.credit(50,'07/08/17')
      money_tracker.debit(10,'07/08/17')
    end

    it "can deduct credit from the balance" do
      expect(money_tracker.balance).to eq 40.0
    end

    it "can store date debit was made" do
      expect(money_tracker.debits).to eq [{"07/08/17" => 10.0}]
    end
  end
end
