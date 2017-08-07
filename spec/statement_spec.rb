require 'statement'

describe Statement do

  it "formats transactions" do
    transactionList = double("transactionList")
    allow(transactionList).to receive(:list).and_return([])
    statement = Statement.new(transactionList)
    expect { statement.display_transactions }.to output("date || credit || debit || balance\n").to_stdout
  end

end
