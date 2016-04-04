require 'bank'
require 'Timecop'

describe Bank do

  subject(:bank) {described_class.new}

  it 'initially has a balance of zero' do
    expect(bank.balance).to eq 0
  end

  it 'can deposit money into the account' do
    bank.deposit(100)
    expect(bank.balance).to eq 100
  end

  it 'can withdraw moeny from the account' do
    bank.withdraw(100)
    expect(bank.balance).to eq -100
  end

  it 'can set the date' do
    bank.set_date('14/01/2012')
    expect(bank.date).to eq '14/01/2012'
  end


  it 'can default to the current date' do
    Timecop.freeze(Time.local(2012))
    expect(bank.date).to eq '01/01/2012'
  end


end
