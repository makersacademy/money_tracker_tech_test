require "transaction"

describe "Transaction" do

  before(:each) do
    @date = double(:date)
    @amountChange = double(:amountChange)
    @transaction = Transaction.new(@date, @amountChange )
  end

  it  "has a date" do
    expect(@transaction.date).not_to eq nil
  end

  it  "has a change of money" do
    expect(@transaction.amountChange).not_to eq nil
  end

  #  it "starts with a balance of 0" do
  #    expect(@account.balance).to eq 0
  # end
  #
  # it "has a record of its transactions" do
  #   @account.addTransaction(@transaction)
  #   expect(@account.history).to eq [@transaction]
  # end

end
