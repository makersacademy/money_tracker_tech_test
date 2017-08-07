require 'tracker.rb'

describe Tracker do
  subject(:tracker) { described_class.new }

  it "is initialised with a 0 balance" do
    expect(tracker.balance).to eq 0
  end

  describe "#record_debit" do
    it "updates the user's balance after a withdrawal" do
      tracker.record_debit(500, transaction = Transaction.new)
      expect(tracker.balance).to eq -500
    end
  end

  describe "#record_credit" do
    it "updates the user's balance after deposit" do
      tracker.record_credit(500, transaction = Transaction.new)
      expect(tracker.balance).to eq 500
    end
  end
end
