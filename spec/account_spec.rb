describe Account do

  subject(:account) { described_class.new(transaction_class) }
  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:transaction) { double :transaction }
  AMOUNT = 10
  DATE = "16/05/16"

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
    before(:each) do
      allow(transaction).to receive(:amount)
      allow(transaction).to receive(:update_transaction_balance)
    end

    it "should instantiate a new Transaction object" do
      expect(transaction_class).to receive(:new)
      account.credit(AMOUNT, DATE)
    end

    it "should push the transaction object into the transactions array" do
      account.credit(AMOUNT, DATE)
      expect(account.transactions).to include(transaction)
    end

    it "should call calculate_balance method" do
      expect(account).to receive(:calculate_balance)
      account.credit(AMOUNT, DATE)
    end

  end

  describe "#debit" do
    before(:each) do
      allow(transaction).to receive(:amount)
    end

    it "should instantiate a new Transaction object" do
      expect(transaction_class).to receive(:new)
      account.debit(10, "16/05/16")
    end

    it "should push the transaction object into the transactions array" do
      account.debit(AMOUNT, DATE)
      expect(account.transactions).to include(transaction)
    end

    it "should call calculate_balance method" do
      expect(account).to receive(:calculate_balance)
      account.debit(AMOUNT, DATE)
    end
  end

  # describe "#print_statement" do
  #   it "should print with date, amount and balance"
  # end

end
