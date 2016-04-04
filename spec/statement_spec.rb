require 'statement'
require 'Timecop'

describe Statement do

  subject(:statement) {described_class.new}

  before(:example) do
    Timecop.freeze(Time.local(2012, 1, 14, 0, 0))
  end

  it 'can store a deposit' do
    statement.input(Time.now, 100, 100)
    expect(statement.instance_variable_get(:@information)).to eq({Time.now => {amount: 100, balance: 100}})
  end

  it 'can store a withdrawl' do
    statement.input(Time.now, -100, -100)
    expect(statement.instance_variable_get(:@information)).to eq({Time.now => {amount: -100, balance: -100}})
  end

  it 'can print out a one line deposit statement' do
    statement.input(Time.now, 100, 100)
    expect(statement.print_out).to eq "date || credit || debit || balance\n14/01/2012 || 100.00 || || 100.00\n"
  end

  it 'can print out a one line withdraw statement' do
    statement.input(Time.now, -100, -100)
    expect(statement.print_out).to eq "date || credit || debit || balance\n14/01/2012 || || 100.00 || -100.00\n"
  end

  it 'can print out a two line statement' do
    Timecop.freeze(Time.local(2012, 1, 13, 0, 0))
    statement.input(Time.now, 2000, 2000)
    Timecop.freeze(Time.local(2012, 1, 14, 0, 0))
    statement.input(Time.now, -500, 1500)
    expect(statement.print_out).to eq "date || credit || debit || balance\n14/01/2012 || || 500.00 || 1500.00\n13/01/2012 || 2000.00 || || 2000.00\n"
  end
end
