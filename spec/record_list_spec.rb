require 'record_list'

describe RecordList do

  let(:record_list) { described_class.new }
  let(:entry) { double(:entry) }

  describe "#attributes" do
    it "initializes with an empty list" do
      expect(subject.list).to eq([])
    end
  end

  describe "#create_entry" do
    it "can create a new entry" do
      allow(entry).to receive(:set_attributes)
      record_list.create_entry(20, "2017-02-02")
      expect(record_list.list.length).to eq(1)
    end
  end
end
