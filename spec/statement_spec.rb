require 'statement'

describe Statement do
  let(:deposit) { double :deposit, amount: 100, date: '10-1-2012', class: Deposit }
  let(:withdrawal) { double :withdrawal, amount:50, date: '11-1-2012', class: Withdrawal }
  let(:statement) { described_class.new }

  describe "Initialization" do
    it "has an empty log array" do
      expect(statement.log.empty?).to eq true
    end

    it 'has a balance of zero' do
      expect(statement.balance).to eq(0)
    end

  end

  describe "add_transaction" do
    it "adds the transaction to the log" do
      statement.add_transaction(deposit)
      expect(statement.log).to include(deposit)
    end
  end

  describe "calculate_balance" do
    it "adds to the balance for a deposit" do
      statement.add_transaction(deposit)
      statement.calculate_balance
      expect(statement.balance).to eq(100)
    end

    it "subtracts from the balance for a withdrawal" do
      statement.add_transaction(deposit)
      statement.add_transaction(withdrawal)
      statement.calculate_balance
      expect(statement.balance).to eq(50)
    end
  end

end
