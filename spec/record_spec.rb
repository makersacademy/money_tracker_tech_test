require './lib/record.rb'

describe Record do

  subject(:record) { described_class.new(100, "07/08/2017") }
  let(:my_ledger) { double(:ledger) }

  describe "#attributes" do
    it "initializes with an amount and date" do
      expect(record).to have_attributes(amount: 100, date: "07/08/2017" )
    end
    it "can read the amount" do
      expect(record.amount).to eq(100)
    end
    it "can read the date" do
      expect(record.date).to eq("07/08/2017")
    end
  end

  describe "#format" do
    it "formats the record and turns it into a hash" do
      expect(record.format).to eq({100 => "07/08/2017"})
    end
  end

  describe "#add" do
    it "accepts one argument" do
      expect(record).to respond_to(:add).with(1).argument
    end

    it "adds the record to the transactions array" do
      allow(my_ledger).to receive(:transactions).and_return([])
      record.add(my_ledger)
      expect(my_ledger.transactions).to eq([{100 => "07/08/2017"}])
    end
  end
end
