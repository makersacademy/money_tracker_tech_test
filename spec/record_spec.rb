require './lib/record.rb'

describe Record do

  subject(:record) { described_class.new(100, "07/08/2017") }

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
end
