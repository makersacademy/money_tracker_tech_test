require "./lib/transaction.rb"

describe Transaction do
subject(:transaction) {described_class.new('14/01/2012', 50, 0, 50)}


  describe "#initialize" do
    it "has a date" do
      expect(transaction.date).not_to be_empty
    end

    it "has either a credit or debit amount greater than zero" do
      expect(transaction.credit > 0 || transaction.debit > 0).to be(true)
    end

    it "has either a credit or debit amount of zero" do
      expect(transaction.credit == 0 || transaction.debit == 0).to be(true)
    end

    it "has an associated balance" do
      expect(transaction.balance).not_to be_nil
    end
  end

end
