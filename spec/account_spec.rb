describe Account do

  subject(:account) { described_class.new(transaction_class) }
  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:transaction) { double :transaction }

  it "should initialize with a balance of 0" do
    expect(account.balance).to eq 0
  end

  it "should initialize with an empty transactions array" do
    expect(account.transactions).to eq []
  end

  it "should initialize with an injection of the Transaction class" do
    expect(account.transaction_class).to eq transaction_class
  end

  describe "#credit" do
    it "should instantiate a new Transaction object" do
      expect(transaction_class).to receive(:new)
      account.credit(10, "16/05/16")
    end

    # it "should push the transaction object into the transactions array" do
    #   account.credit()
    # end
  end

  describe "#debit" do
    it "should instantiate a new Transaction object" do
      expect(transaction_class).to receive(:new)
      account.debit(10, "16/05/16")
    end
  end

end
