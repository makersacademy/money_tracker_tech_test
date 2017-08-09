require 'tracker'

describe Tracker do
  let(:transactions) { double('transactions') }
  subject(:tracker) { described_class.new(transactions) }

  describe "#record_spending" do
    it "should call add_transaction" do
      allow(transactions).to receive(:add_transaction)
      expect(transactions).to receive(:add_transaction)
      tracker.record_spending(10, "9th Jan 2017")
    end
  end
  describe "#record_earning" do
    it "should call add_transaction" do
      allow(transactions).to receive(:add_transaction)
      expect(transactions).to receive(:add_transaction)
      tracker.record_earning(10, "9th Jan 2017")
    end
  end
end
