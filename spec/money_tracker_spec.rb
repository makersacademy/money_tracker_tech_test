describe MoneyTracker do

  let(:money_tracker) { MoneyTracker.new }

  it { is_expected.to respond_to(:earn).with(1).arguments }
  it { is_expected.to respond_to(:spend).with(1).arguments }

  describe "#initialise" do
    it "initialises with a balance of 0" do
      tracker = MoneyTracker.new
      expect(tracker.balance).to eq 0
    end
  end

  before(:each) do
    money_tracker.earn(50)
  end

  describe "#earn" do
    it "can add credit to the balance" do
      expect(money_tracker.balance).to eq 50
    end

    it "saves credit transaction when credit is added" do
      expect(money_tracker.transactions.list).to eq [{:date=>date, :amount=>50, :balance=>50}]
    end
  end

  describe "#spend" do
    before do
      money_tracker.spend(10)
    end

    it "can deduct credit from the balance" do
      expect(money_tracker.balance).to eq 40
    end

    it "saves debit transaction" do
      expect(money_tracker.transactions.list).to eq [{:date=>date, :amount=>50, :balance=>50},{:date=>date, :amount=>-10, :balance=>40}]
    end
  end

  describe "#print_statement" do
    before do
      money_tracker.spend(10)
    end

    it "can print a statement" do
      expect{ money_tracker.print_statement }.to output("Date || Credit || Debit || Balance\n08/09/2017 ||  || -10 || 40\n08/09/2017 || 50 ||  || 50\n").to_stdout
    end
  end
end
