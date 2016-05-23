require 'account'
require 'date'

Rspec.feature "Printing a statement", type: :feature do

  subject(:account) { Account.new }
  let(:statement) { File.read("spec/support/statement.txt") }

  scenario "customer can print a full statement of account history" do
    account.deposit(1000, Date.parse("10-01-2012"))
    account.deposit(2000, Date.parse("13-01-2012"))
    account.withdraw(500, Date.parse("14-01-2012"))

    expect{ account.print_statement }.to output(statement).to_stdout

  end


end
