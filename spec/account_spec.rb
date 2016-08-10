require "account"

describe "Account" do

  before(:each) do
    @account = Account.new
  end

   it "starts with a balance of 0" do
     expect(@account.balance).to eq 0
  end

  it "contains transactions" do
  end

  # it "accepts a transaction" do
  #
  # end
end
