require "./lib/statement.rb"

describe Statement do
let(:transaction_klass) { double :transaction_klass }
subject(:statement) {described_class.new(transaction_klass)}
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
      expect{ statement.new_transaction(50, 0, date, 50) }.to change{ statement.history.length }.by(1)
    end

    xit "calls for a new transaction to be created" do
      expect(transaction_klass).to receive(:new).with(date, 50, 0, 50)
      statement.new_transaction(50, 0, date, 50)
    end

  end

  describe "#print" do
    it "displays the previous transactions with no filter - last on top" do
      statement.new_transaction(50, 0, Time.new(2012, 01, 10), 50)
      statement.new_transaction(0, 10, Time.new(2012, 01, 14), 40)
      expect(statement.print).to eq "date || credit || debit || balance\n14/01/2012 ||  || 10.00 || 40.00\n10/01/2012 || 50.00 ||  || 50.00"
    end

    it "displays only deposit transactions with deposit filter" do
      statement.new_transaction(50, 0, Time.new(2012, 01, 10), 50)
      statement.new_transaction(0, 10, Time.new(2012, 01, 14), 40)
      expect(statement.print('deposit')).to eq "date || credit || debit || balance\n10/01/2012 || 50.00 ||  || 50.00"
    end

    it "displays only withdrawal transactions with withdrawal filter" do
      statement.new_transaction(50, 0, Time.new(2012, 01, 10), 50)
      statement.new_transaction(0, 10, Time.new(2012, 01, 14), 40)
      expect(statement.print('withdrawal')).to eq "date || credit || debit || balance\n14/01/2012 ||  || 10.00 || 40.00"
    end

    it "displays transactions sorted date ascending" do
      statement.new_transaction(50, 0, Time.new(2012, 01, 10), 50)
      statement.new_transaction(0, 10, Time.new(2012, 01, 14), 40)
      expect(statement.print('ascending')).to eq "date || credit || debit || balance\n10/01/2012 || 50.00 ||  || 50.00\n14/01/2012 ||  || 10.00 || 40.00"
    end

    it "displays transactions sorted date descending" do
      statement.new_transaction(0, 10, Time.new(2012, 01, 14), 40)
      statement.new_transaction(50, 0, Time.new(2012, 01, 10), 50)
      expect(statement.print('descending')).to eq "date || credit || debit || balance\n14/01/2012 ||  || 10.00 || 40.00\n10/01/2012 || 50.00 ||  || 50.00"
    end
  end

end
