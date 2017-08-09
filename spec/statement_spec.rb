require 'statement'

describe Statement do

  let(:transactions) { double('transactions') }
  let(:earning) { double('earning', date: Date.parse("7, Aug, 2017"), debit: 0, credit: 100) }
  let(:spending) { double('spending', date: Date.parse("8, Aug, 2017"), debit: 50, credit: 0) }

  subject(:statement) { described_class.new(transactions )}

  describe "#generate_statement" do
    it "should print standard headers" do
      expect { statement.generate_statement }.to output("date | debit | credit | balance\n").to_stdout
    end
  end
end
