require 'account'

describe Account do
  
  let(:account) { Account.new([], 2000) }
  let(:entry) { double(:entry) }
  let(:second_entry) { double(:entry) }
  before(:each) do
    allow(entry).to receive(:credit).and_return(500)
    allow(entry).to receive(:debit).and_return(nil)
    allow(second_entry).to receive(:debit).and_return(500)
    allow(second_entry).to receive(:credit).and_return(nil)
    allow(entry).to receive(:date).and_return('2017-06-06')
    allow(second_entry).to receive(:date).and_return('2017-06-06')
  end

  it { is_expected.to respond_to(:entries) }
  it { is_expected.to respond_to(:balance) }

  it 'is initialized with an empty array of entries' do
    expect(account.entries).to match_array([])
  end

  it 'is initialized with a balance of 2000' do
    expect(account.balance).to eq 2000
  end

  describe '#add_entry' do
    it 'adds an entry to the entries array' do
      account.add_entry(entry)
      expect(account.entries.last).to eq entry
    end
  end

  describe '#balance_update' do
    it 'updates the balance according to the given entry amount' do
      account.add_entry(entry)
      account.balance_update(entry)
      expect(account.balance).to eq 2500
    end
  end

  describe '#statement' do
    it 'prints an account statement to stadard output' do
      account.add_entry(entry)
      account.add_entry(second_entry)
      expect { account.statement }.to output("date || credit || debit || balance\n2017-06-06 || 500 || || 2500\n2017-06-06 || || 500 || 2000\n").to_stdout
    end
  end
end
