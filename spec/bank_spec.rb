require 'bank'

describe Bank do

  subject(:bank) {described_class.new}

  it 'has an initial balance of zero' do
    expect(bank.balance).to eq Bank::BALANCE
  end

  it 'accepts a deposit amount and date' do
    bank.deposit(1000, '10-01-2012')
    expect(bank.balance).to eq(1000)
  end

end
