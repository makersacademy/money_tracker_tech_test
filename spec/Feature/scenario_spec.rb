require "./lib/account.rb"
require "./lib/transaction.rb"

describe "bank deposit" do
  let(:account) { Account.new }

  it "records and prints transactions" do
    account.deposit(1000, Time.new(2012, 01, 10))
    account.deposit(2000, Time.new(2012, 01, 13))
    account.withdraw(500, Time.new(2012, 01, 14))
    expect(account.balance).to eq(2500)
    expect(account.print_statement).to eq "date || credit || debit || balance\n14/01/2012 || 0.00 || 500.00 || 2500.00\n13/01/2012 || 2000.00 || 0.00 || 3000.00\n10/01/2012 || 1000.00 || 0.00 || 1000.00"
  end
end
