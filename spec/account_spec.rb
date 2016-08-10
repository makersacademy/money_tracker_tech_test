require "account"

describe "Account" do
  account = new Account

   it "starts with a balance of 0" do
     expect(account.balance).to eq 0
  end

  # it "accepts a transaction" do
  #
  # end
end
