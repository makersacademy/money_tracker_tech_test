require 'statement'

describe Statement do

  subject(:statement) {described_class.new}

  it 'can store a deposit' do
    statement.input("14/01/2012", 100, 100)
    expect(statement.information).to eq({"14/01/2012" => {amount: 100, balance: 100}})
  end

  it 'can store a withdrawl' do
    statement.input("14/01/2012", -100, -100)
    expect(statement.information).to eq({"14/01/2012" => {amount: -100, balance: -100}})
  end

  it 'can print out a one line deposit statement' do
    statement.input("14/01/2012", 100, 100)
    expect(statement.print_out).to eq "date || credit || debit || balance \n14/01/2012 || 100.00 || || 100.00 \n"
  end

  it 'can print out a one line withdraw statement' do
    statement.input("14/01/2012", -100, -100)
    expect(statement.print_out).to eq "date || credit || debit || balance \n14/01/2012 || || 100.00 || -100.00 \n"
  end

  it 'can print out a two line statement' do
    statement.input("13/01/2012", 2000, 2000)
    statement.input("14/01/2012", -500, 1500)
    expect(statement.print_out).to eq "date || credit || debit || balance \n14/01/2012 || || 500.00 || 1500.00 \n13/01/2012 || 2000.00 || || 2000.00 \n"
  end
end
