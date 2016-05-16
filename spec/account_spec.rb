describe Account do

  subject(:account) { described_class.new(transaction_class) }
  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:transaction) { double :transaction }
  AMOUNT = 10
  DATE = "16/05/16"
  STATEMENT = "date || credit || debit || balance \n 16/05/16 || 30 ||  || 30 \n"

  it "should initialize with a balance of 0" do
    expect(account.balance).to eq 0
  end

  it "should initialize with an empty transactions array" do
    expect(account.transactions).to eq []
  end

  it "should initialize with an injection of the Transaction class" do
    expect(account.transaction_class).to eq transaction_class
  end

  before(:each) do
    allow(transaction).to receive(:amount)
    allow(transaction).to receive(:update_transaction_balance)
  end

  describe "#deposit" do
    it "should instantiate a new Transaction object" do
      expect(transaction_class).to receive(:new)
      account.deposit(AMOUNT, DATE)
    end

    it "should push the transaction object into the transactions array" do
      account.deposit(AMOUNT, DATE)
      expect(account.transactions).to include(transaction)
    end

    it "should call calculate_balance method" do
      expect(account).to receive(:calculate_balance)
      account.deposit(AMOUNT, DATE)
    end

    it "should call the update_transaction_balance on transaction" do
      expect(transaction).to receive(:update_transaction_balance)
      account.deposit(AMOUNT, DATE)
    end

  end

  describe "#withdraw" do
    it "should instantiate a new Transaction object" do
      expect(transaction_class).to receive(:new)
      account.withdraw(10, "16/05/16")
    end

    it "should push the transaction object into the transactions array" do
      account.withdraw(AMOUNT, DATE)
      expect(account.transactions).to include(transaction)
    end

    it "should call calculate_balance method" do
      expect(account).to receive(:calculate_balance)
      account.withdraw(AMOUNT, DATE)
    end

    it "should call the update_transaction_balance on transaction" do
      expect(transaction).to receive(:update_transaction_balance)
      account.withdraw(AMOUNT, DATE)
    end
  end

  describe "#check_statement" do
    before(:each) do
      allow(transaction).to receive(:amount).and_return(30)
      allow(transaction).to receive(:date).and_return("16/05/16")
      allow(transaction).to receive(:balance_after_transaction).and_return(30)
    end

    it "should print with date, amount and balance" do
      account.deposit(30, "16/05/16")
      expect(account.check_statement).to eq STATEMENT
    end
  end

end
