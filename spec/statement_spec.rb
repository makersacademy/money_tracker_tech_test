require 'statement'

describe Statement do

  let(:record_list) do
    record_list = double('record_list')
  end

  it "creates formatted statement" do
    allow(record_list).to receive_message_chain(:get_list, :reverse, :each).and_return("statement text")
    statement = Statement.new(record_list)
    expect(statement.display_transactions).to eq("statement text")
  end

end
