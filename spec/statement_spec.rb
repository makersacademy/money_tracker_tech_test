require 'statement'

describe Statement do

  let(:earning) { double('earning', date: Date.parse("7, Aug, 2017"), debit: 0, credit: 100) }
  let(:spending) { double('spending', date: Date.parse("7, Aug, 2017"), debit: 50, credit: 0) }
  let(:transactions) { [earning, spending] }

  subject(:statement) { described_class.new(transactions)}

  describe "#generate_statement" do
    it "should display the statement" do
      expect { statement.generate_statement }.to output("date | debit | credit | balance\n2017-08-07 | 0 | 100 | 100\n2017-08-07 | 50 | 0 | 50\n").to_stdout
    end
  end
end
