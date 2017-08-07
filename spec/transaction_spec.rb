require 'transaction.rb'

describe Transaction do
  subject(:transaction) { described_class.new }
  tracker = Tracker.new

  before do
   new_time = Time.local(2017, 8, 7)
   Timecop.freeze(new_time)
  end

  it "is initialised with the current date" do
    expect(transaction.date).to eq ("07/08/2017")
  end

  after do
    Timecop.return
  end

  describe "#set_debit" do
    it "updates the user's debit" do
      tracker.record_debit(200, transaction = Transaction.new)
      expect(transaction.debit).to eq 200
    end
  end

  describe "#set_credit" do
    it "updates the user's credit" do
      tracker.record_credit(300, transaction = Transaction.new)
      expect(transaction.credit).to eq 300
    end
  end
end
