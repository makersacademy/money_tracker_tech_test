require 'transaction.rb'

describe Transaction do
  subject(:transaction) { described_class.new("02/08/2017", -300) }

  it "is initialised with the date set by the user" do
    expect(transaction.date).to eq "02/08/2017"
  end

  it "is initialised with the amount set by the user" do
    expect(transaction.amount).to eq -300
  end

  describe "#format_for_statement" do
    it "returns the formatted transaction date and amount" do
      expect(transaction.format_for_statement).to eq "02/08/2017 || || 300.00 || "
    end
  end
end
