require "./lib/statement.rb"

describe Statement do
subject(:statement) {described_class.new(transaction_klass)}
let(:transaction_klass) { double :transaction_klass }
let(:date) { Time.new(2012, 01, 10) }

  before do
    allow(transaction_klass).to receive(:new)
  end

  describe "#initialize" do
    it "creates a new transaction list which is blank on initialization" do
      expect(statement.history).to eq []
    end
  end

  describe "#new_transaction" do
    it "adds a new transaction to the list" do
      expect{ statement.new_transaction(0,5,date) }.to change{ statement.history.length }.by(1)
    end

    it "calls for a new transaction to be created" do
      expect(transaction_klass).to receive(:new)
      statement.new_transaction(10, 0, date)
    end

  end

  describe "#print_statement" do
    it "displays the previous transactions" do
      statement.new_transaction(50, 0, Time.new(2012, 01, 10))
      statement.new_transaction(0, 10, Time.new(2012, 01, 14))
      expect(statement.print(40)).to eq "date || credit || debit || balance\n14/01/2012 || 0.00 || 10.00 || 40.00\n10/01/2012 || 50.00 || 0.00 || 50.00"
    end
  end

end
