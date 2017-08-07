describe MoneyTracker do

  let(:money_tracker) { MoneyTracker.new }

  it "initialises with a balance of 0" do
    expect(money_tracker.balance).to eq 0
  end

  it "can add credit to balance" do
    money_tracker.credit(50)
    expect(money_tracker.balance).to eq 50
  end
end
