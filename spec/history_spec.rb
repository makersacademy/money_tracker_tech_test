require "./lib/history.rb"

describe History do
  subject(:history) {described_class.new}

  describe "#initialize" do

    it "initializes with a blank array for history" do
      expect(history.unfiltered_history).to eq([])
    end

  end

  describe "#receive_entry" do

    it "receives a new item and pushes it to the array" do
      item = {deposit: "5.00", withdrawal: '', date: "4/4/2016", balance: "5.00"}
      history.receive_entry(item)
      expect(history.unfiltered_history).to eq([{deposit: "5.00", withdrawal: '', date: "4/4/2016", balance: "5.00"}])
    end

  end


  context "formatting statements" do
    describe "#standard_statement" do

      it "returns the statement with full details with one depoist" do
        item = {deposit: '5.00', withdrawal: '', date: '4/4/2016', balance: '5.00'}
        history.receive_entry(item)
        expect(history.standard_statement).to eq("Date || Credit || Debit || Balance", "4/4/2016 || 5.00 ||  || 5.00")
      end
    end
  end

end
