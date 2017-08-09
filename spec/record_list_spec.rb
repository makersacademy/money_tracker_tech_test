require 'record_list'

describe RecordList do

  let(:record_list) { described_class.new }

  let(:entry) do
    entry = double('entry')
  end

  describe "#attributes" do
    it "initializes with an empty list" do
      expect(subject.list).to eq([])
    end
  end

  it "can show the list of entries" do
    allow(entry).to receive(:set_attributes)
    record_list.create_entry(20, entry)
    expect(record_list.list).to eq([entry])
  end

  describe "#create_entry" do
    it "can create a new entry" do
      allow(entry).to receive(:set_attributes)
      record_list.create_entry(20, entry)
      expect(record_list.list.length).to eq(1)
    end
  end
end
