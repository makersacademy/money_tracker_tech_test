require 'bank_account'
require 'transaction'

EXPECTATION = 'date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00'

describe 'running the acceptance test' do

  it 'can complete the test' do
    my_account = BankAccount.new Transaction
    my_account.deposit Date.new(2012,01,10), 1000
    my_account.deposit Date.new(2012,01,13), 2000
    my_account.withdraw Date.new(2012,01,14), 500
    expect(my_account.print_statement).to eq EXPECTATION
  end

end
