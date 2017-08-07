
describe Statement do

  let(:transactions) { [double("TransactionOne", time: "10/10/2017", debit: 0, credit: 100, balance: 200),
    double("TransactionTwo", time: "12/10/2017", debit: 50, credit: 0, balance: 150)] }

  let(:transactions_log) { double("Transactions_Log", history: transactions) }
  subject(:statement) { described_class.new(transactions_log) }

  describe "#print_it" do

    let(:chron_transactions) { [double("TransactionTwo", time: "12/10/2017", debit: 50, credit: 0, balance: 150),
     double("TransactionOne", time: "10/10/2017", debit: 0, credit: 100, balance: 200)] }

    before do
      allow(transactions_log).to receive(:reverse!)
      allow(chron_transactions).to receive(:each)
    end

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
    xit "will print the account's history to STDOUT in reverse chron order" do
      expect{statement.print_it}.to output(" date | credit | debit | balance \n 12/10/2017 |  0 |  50 |  150  \n 10/10/2017 |  100 |  0 |  200  \n").to_stdout
    end
  end

end
