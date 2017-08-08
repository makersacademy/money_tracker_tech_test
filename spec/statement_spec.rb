require 'statement'

describe Statement do

  let(:transaction_list) do
    transaction_list = double('transaction_list')
  end

  it "creates formatted statement" do
    allow(transaction_list).to receive_message_chain(:get_list, :reverse, :each)
    statement = Statement.new(transaction_list)
    expect { statement.display_transactions }.to output("date || credit || debit\n").to_stdout
  end

end
