require "bank"

describe Bank do
  TODAY = 16/05/2016

  let(:bank) {described_class.new}

  describe "#initialize" do
    it "initializes with an empty transactions array" do
      expect(bank.transactions.empty?).to be(true)
    end
  end

  describe "#todays_date" do
    it "returns todays date dd/mm/yyyy" do
      expect(bank.todays_date).to eq(TODAY)
    end
  end


end
