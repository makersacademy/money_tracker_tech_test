require 'account'

describe Account do
  
  let(:account) { Account.new([]) }
  let(:entry) { double(:entry) }

  it { is_expected.to respond_to(:entries) }

  it 'is initialized with an empty array of entries' do
    expect(account.entries).to match_array([])
  end

  describe '#add_entry' do
    it 'adds an entry to the entries array' do
      expect{ account.add_entry(entry) }.to change{ account.entries.length }.by(1)
    end
  end

  describe '#get_entry_index' do
    it "retrieves the index of an entry in the entries array" do
      account.add_entry(entry)
      p account
      expect(account.get_entry_index(entry)).to eq 0
    end
  end
end
