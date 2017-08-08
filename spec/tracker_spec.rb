require 'tracker.rb'

describe Tracker do
  subject(:tracker) { described_class.new }

  it "is initialized with an empty array of transactions" do
    expect(tracker.transactions).to be_empty
  end

  describe "#record_transaction" do
    it "adds the transaction to the transactions history" do
      new_trans = double(:transaction, amount: 300)
      tracker.record_transaction(new_trans)
      expect(tracker.transactions).to include new_trans
    end
  end

    # it "prints out all the records" do
    #   tracker.record_credit(500, transaction = Transaction.new)
    #   tracker.record_credit(1200, transaction = Transaction.new)
    #   tracker.record_debit(300, transaction = Transaction.new)
    #   expect(tracker.show_statement).to eq "date || credit || debit || balance
    #                                         07/08/2017 || 500 || || 500
    #                                         07/08/2017 || 1200 || || 1700
    #                                         07/08/2017 || || 300 || 1400"
    # end

end
