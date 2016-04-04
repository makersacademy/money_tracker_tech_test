require 'statement'

describe Statement do
  let(:deposit) { double :deposit }
  let(:statement) { described_class.new }

  describe "Initialization" do
    it "has an empty log array" do
      expect(statement.log.empty?).to eq true
    end
  end

  describe "add_transaction" do
    it "adds the transaction to the log" do
      statement.add_transaction(deposit)
      expect(statement.log).to include(deposit)
    end
  end

end
