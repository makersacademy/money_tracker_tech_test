require 'statement'

describe Statement do

  let(:record_list) { double(:record_list) }
  let(:entries_array) { [mock_entry] }
  let(:mock_entry) { double(date: "02/02/2017", credit: 40, debit: nil) }

  describe "#attributes" do
    it "initializes with a list of records" do
      allow(record_list).to receive_message_chain(:list, :reverse, :each_with_index)
      statement = Statement.new(record_list)
      expect(statement.list).not_to eq(nil)
    end

    it "initializes with an empty balance list" do
      allow(record_list).to receive_message_chain(:list)
      statement = Statement.new(record_list)
      expect(statement.balance_list).to eq([])
    end
  end

  describe "#display_collated_statement" do
    it "creates a statement" do
      allow(record_list).to receive_message_chain(:list).and_return(entries_array)
      statement = Statement.new(record_list)
      expect { statement.display_collated_statement }.to output("date || credit || debit || balance\n 02/02/2017 || 40 ||  || 40 \n").to_stdout
    end
  end

end
