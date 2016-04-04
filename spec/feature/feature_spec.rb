require 'account.rb'
require 'statement.rb'

describe "User Interaction" do
  subject(:statements) {Statements.new}
  subject(:account) {Account.new}

  before(:each) do 
    account.deposit(100)
    account.deposit(250)
    account.withdraw(50)
  end

  it "returns correct balance" do
  	expect(account.balance).to eq 300  
  end
end