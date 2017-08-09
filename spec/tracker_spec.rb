require 'tracker'

describe Tracker do
  let(:list) { [earning, spending] }
  let(:transactions) { double('transactions', transaction_list: list) }
  let(:statement) { double('statement', generate_statement: nil)}
  let(:earning) { double('earning', date: Date.parse("7, Aug, 2017"), debit: 0, credit: 100) }
  let(:spending) { double('spending', date: Date.parse("7, Aug, 2017"), debit: 50, credit: 0) }
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

  describe "#display_statement" do
    it "should call for statement to be generated" do
      allow(Statement).to receive(:new).and_return(statement)
      expect(statement).to receive(:generate_statement)
      tracker.display_statement
    end
  end

end
