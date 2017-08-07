require 'tracker.rb'

describe Tracker do
  subject(:tracker) { described_class.new }

  it "is initialized with a 0 balance" do
    expect(tracker.balance).to eq 0
  end

  it "is initialised with a 0 debit" do
    expect(tracker.debit).to eq 0
  end

  it "is initialised with a 0 credit" do
    expect(tracker.credit).to eq 0
  end
end
