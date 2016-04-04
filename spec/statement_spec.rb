require 'statement'

describe Statement do

  subject(:statement) {described_class.new}

  it 'can store a deposit' do
    statement.input("14/01/2012", 100)
    expect(statement.information).to eq({"14/01/2012" => 100})
  end

  it 'can store a withdrawl' do
    statement.input("14/01/2012", -100)
    expect(statement.information).to eq({"14/01/2012" => -100})
  end

  it 'can print out a one line deposit statement' do
    statement.input("14/01/2012", 100)
    expect(statement.print_out).to eq "date || credit || debit || balance \n14/01/2012 || || 100.00 || 100.00"
  end

  it 'can print out a one line withdraw statement' do
    statement.input("14/01/2012", -100)
    expect(statement.print_out).to eq "date || credit || debit || balance \n14/01/2012 || 100.00 || || -100.00"
  end
end
