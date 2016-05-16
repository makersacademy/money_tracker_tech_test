require 'account'

describe Account do

  subject(:account) { described_class.new(transaction) }
  let(:transaction) { double :transaction }

  it "should initialize with a balance of 0" do
    expect(account.balance).to eq 0
  end

  it "should initialize with an empty transactions array" do
    expect(account.transactions).to eq []
  end

  it "should initialize with an injection of the Transaction class" do
    expect(account.transaction_class).to eq transaction
  end

  it "should respond to #credit with one argument" do
    expect(account).to respond_to(:credit).with(1).argument
  end

  # describe "#credit" do
  #   it "should instantiate a new Transaction object" do
  #     account.credit
  #     expect(account.credit_transaction).to eq transaction
  #   end
  # end

end
