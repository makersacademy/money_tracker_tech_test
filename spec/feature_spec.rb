require 'bank'
require 'statement'

describe "Feature" do

  let(:bank) {Bank.new}

  it 'should be able to do the acceptance criteria' do
    bank.set_date('10/01/2012')
    bank.deposit(1000)
    bank.set_date('13/01/2012')
    bank.deposit(2000)
    bank.set_date('14/01/2012')
    bank.withdraw(500)
    expect(bank.request_statement).to eq "date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00\n"
  end

end
