require 'tracker.rb'

describe Tracker do
  subject(:tracker) { described_class.new }

  it "is initialized with a 0 balance" do
    expect(tracker.balance).to eq 0
  end

  it "is initialised with a 0 debit" do
    expect(tracker.debit).to eq 0
  end

  it "is initialised with a 0 credit" do
    expect(tracker.credit).to eq 0
  end

  describe "#record_debit" do
    it "updates the user's debit" do
      tracker.record_debit(200)
      expect(tracker.debit).to eq 200
    end

    it "updates the user's balance" do
      tracker.record_debit(500)
      expect(tracker.balance).to eq -500
    end
  end

  describe "#record_credit" do
    it "updates the user's credit" do
      tracker.record_credit(500)
      expect(tracker.credit).to eq 500
    end

    it "updates the user's balance" do
      tracker.record_credit(500)
      expect(tracker.balance).to eq 500
    end
  end

end
