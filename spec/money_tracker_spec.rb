describe MoneyTracker do

  let(:money_tracker) { MoneyTracker.new }

  it { is_expected.to respond_to(:credit).with(1).arguments }
  it { is_expected.to respond_to(:debit).with(1).arguments }
  it { is_expected.to respond_to(:save_transaction).with(3).arguments }

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
  end

  describe "#debit" do
    before do
      money_tracker.credit(50)
      money_tracker.debit(10)
    end

    it "can deduct credit from the balance" do
      expect(money_tracker.balance).to eq 40
    end
  end

  describe "#save_transaction" do
    before do
      allow(money_tracker.transaction).to receive(:list).and_return([])
    end

    it "can save date, amount and balance at time of credit" do
      money_tracker.save_transaction("07/08/2017", 20, 20)
      expect(money_tracker.transaction.list).to eq([{:date=>"07/08/2017", :amount=>20, :balance=>20}])
    end
  end
end
