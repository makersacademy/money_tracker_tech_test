require "account"

describe "Account" do

  before(:each) do
    @trans_log = double(:transaction_log)
    @account = Account.new(0, @trans_log)
    allow(@trans_log).to receive(:transactions).and_return([{"amount" => -34, "date" => "1985-07-20 21:54:40 +0100"}, {"amount" => 434, "date" => "1985-07-20 21:55:40 +0100"}])
  end

   it "starts with a balance of 0" do
     expect(@account.balance).to eq 0
   end

   it "can calculate the balance from the transaction log" do
    @history_with_balance = [{"amount" => 434, "date" => "1985-07-20 21:55:40 +0100", "balance" => 434}, {"amount" => -34, "date" => "1985-07-20 21:54:40 +0100", "balance" => 400}]
    expect(@account.running_balance).to eq(@history_with_balance)
   end

end
