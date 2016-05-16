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

  # describe "#credit" do
  #   it "should "
  # end

end
