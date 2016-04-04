require 'bank'
require 'statement'

describe "Feature" do

  let(:bank) {Bank.new}

  it 'should be able to pass the acceptance criteria' do
    Timecop.freeze(Time.local(2012, 1, 10, 0, 0))
    bank.deposit(1000)
    Timecop.freeze(Time.local(2012, 1, 13, 0, 0))
    bank.deposit(2000)
    Timecop.freeze(Time.local(2012, 1, 14, 0, 0))
    bank.withdraw(500)
    expect(bank.request_statement).to eq "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n"
  end

end
