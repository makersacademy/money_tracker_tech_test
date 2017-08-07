
describe Statement do

  let(:transaction) { [double("Transaction", timestamp: "10/10/2017", debit: 0, credit: 100, balance: 200),
    double("Transaction", timestamp: "12/10/2017", debit: 50, credit: 0, balance: 150)] }

  let(:transactions) { double("Transactions", log: transaction)  }
  subject(:statement) { described_class.new(transactions) }

  describe "#print_it" do
    it "will order the account history by reverse chronology" do
      expect(statement).to receive(:chronify_transactions)
      statement.print_it
    end
    it "will print the statement header" do
      expect(statement).to receive(:print_header)
      statement.print_it
    end
    it "will print each transaction" do
      expect(statement).to receive(:print_each_transaction)
      statement.print_it
    end
    it "will print the account's history to STDOUT in reverse chron order" do
      expect{statement.print_it}.to output(" date | credit | debit | balance \n 12/10/2017 |  0 |  50 |  150  \n 10/10/2017 |  100 |  0 |  200  \n").to_stdout
    end
  end

end
