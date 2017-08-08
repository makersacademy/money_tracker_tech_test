require 'record_list'

describe RecordList do

  let(:entry) do
    entry = double('entry')
  end

  it "can create a new entry" do
    allow(entry).to receive(:set_attributes)
    record_list = RecordList.new
    record_list.create_entry(20, entry)
    expect(record_list.list.length).to eq(1)
  end

  it "can show the list" do
    subject.add_to_list(entry)
    expect(subject.get_list).to eq([entry])
  end

end
