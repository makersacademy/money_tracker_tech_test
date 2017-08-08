describe MoneyTracker do

  let(:money_tracker) { MoneyTracker.new }

  it { is_expected.to respond_to(:credit).with(1).arguments }
  it { is_expected.to respond_to(:debit).with(1).arguments }

  describe "#initialise" do
    it "initialises with a balance of 0" do
      tracker = MoneyTracker.new
      expect(tracker.balance).to eq 0
    end
  end

  before(:each) do
    money_tracker.credit(50)
  end

  describe "#credit" do
    it "can add credit to the balance" do
      expect(money_tracker.balance).to eq 50
    end

    it "saves credit transaction when credit is added" do
      expect(money_tracker.transactions.list).to eq [{:date=>"#{Date.today.strftime("%m/%d/%Y")}", :amount=>50, :balance=>50}]
    end
  end

  describe "#debit" do
    before do
      money_tracker.debit(10)
    end

    it "can deduct credit from the balance" do
      expect(money_tracker.balance).to eq 40
    end

    it "saves debit transaction" do
      expect(money_tracker.transactions.list).to eq [{:date=>"#{Date.today.strftime("%m/%d/%Y")}", :amount=>50, :balance=>50},{:date=>"#{Date.today.strftime("%m/%d/%Y")}", :amount=>-10, :balance=>40}]
    end
  end

  describe "#print_statement" do
    before do
      money_tracker.debit(10)
    end

    it "can print a statement" do
      expect{ money_tracker.print_statement }.to output("Date || Transaction || Balance\n#{Date.today.strftime("%m/%d/%Y")} || 50 || 50\n#{Date.today.strftime("%m/%d/%Y")} || -10 || 40\n").to_stdout
    end
  end
end
