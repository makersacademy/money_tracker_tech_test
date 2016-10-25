require "account"

describe "Account" do

  before(:each) do
    @trans_log = double(:transaction_log)
    @account = Account.new(0, @trans_log)
    allow(@trans_log).to receive(:transactions).and_return([[-34, "1985-07-20 21:54:40 +0100"], [434, "1985-07-20 21:55:40 +0100"]])
    @history_with_balance = [[-34, "1985-07-20 21:54:40 +0100", -34], [434, "1985-07-20 21:55:40 +0100", 400]]
  end

   it "starts with a balance of 0" do
     expect(@account.balance).to eq 0
   end

   it "can calculate the balance from the transaction log" do
    expect(@account.running_balance).to eq(@history_with_balance)
   end
  #
  # it "has a record of its transactions" do
  #   @account.addTransaction(@transaction)
  #   expect(@account.history).to eq [@transaction]
  # end


end
