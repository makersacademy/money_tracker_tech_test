require 'statement'

describe Statement do

  it "formats transactions" do
    transactionList = double('transactionList')
    allow(transactionList).to receive_message_chain(:get_list, :reverse, :each) { "hello" }
    statement = Statement.new(transactionList)
    expect { statement.display_transactions }.to output("date || credit || debit || balance\n").to_stdout
  end

end
