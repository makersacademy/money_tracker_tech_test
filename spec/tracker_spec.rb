require 'tracker'
require 'account'

describe Tracker do

  let(:tracker) { Tracker.new }
  let(:account) { double(:account) }
  let(:entry) { double(:entry) }
  let(:second_entry) { double(:entry) }
  before(:each) do
    allow(entry).to receive(:credit).and_return(1000)
    allow(entry).to receive(:debit).and_return(nil)
    allow(second_entry).to receive(:debit).and_return(500)
    allow(second_entry).to receive(:credit).and_return(nil)
    allow(entry).to receive(:date).and_return('2017-06-06')
    allow(second_entry).to receive(:date).and_return('2017-06-06')
  end

  it { is_expected.to respond_to(:initial_balance) }
  it { is_expected.to respond_to(:account) }

  it 'is initialized with a balance of 0' do
    expect(tracker.initial_balance).to eq 0
  end

  describe '#calculate_balance' do
    it 'calculates the balance according to the given entry' do
      allow(entry).to receive(:net_amount).and_return(1000)
      allow(second_entry).to receive(:net_amount).and_return(-500)
      allow(account).to receive(:get_entry_index).with(second_entry).and_return(1)
      allow(account).to receive(:entries).and_return([entry, second_entry])
      expect(tracker.calculate_balance(account, second_entry)).to eq 500
    end
  end
end
