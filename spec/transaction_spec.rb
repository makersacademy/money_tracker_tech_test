require "transaction"

describe Transaction do
  TODAY = "16/05/2016"

  let(:transaction) {described_class.new(100,nil)}
  let(:transaction_2) {described_class.new(nil,100)}

  describe "#initialize" do
    it "initializes with the transaction time" do
      expect(transaction.time_stamp).to eq(TODAY)
    end

    it "initializes with a deposit value of 100" do
      expect(transaction.credit).to eq(100)
    end

    it "initializes with a credit value of nil" do
      expect(transaction.debit).to eq(nil)
    end

    it "initializes with a deposit value of nil" do
      expect(transaction_2.credit).to eq(nil)
    end

    it "initializes with a credit value of 100" do
      expect(transaction_2.debit).to eq(100)
    end
  end

  describe "#change_balance" do
    it "gives the outcome of the transaction" do
      expect(transaction_2.change_balance).to eq(-100)
    end
  end

end
