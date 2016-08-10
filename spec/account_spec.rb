require "account"

describe "Account" do

  before(:each) do
    @account = Account.new
    @transaction = double(:transaction)
  end

   it "starts with a balance of 0" do
     expect(@account.balance).to eq 0
  end

  it "has a record of its transactions" do
    @account.addTransaction(@transaction)
    expect(@account.history).to eq [@transaction]
  end

end
