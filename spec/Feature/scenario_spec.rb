require "./lib/account.rb"
require "./lib/transaction.rb"

describe "bank deposit" do
  let(:account) { Account.new }
  
  it "adds to balance" do
    account.deposit(50)
    expect(account.balance).to eq(50)
  end
end
