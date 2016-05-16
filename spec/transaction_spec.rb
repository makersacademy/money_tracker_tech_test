require 'transaction'

describe Transaction do

  # let(:subject) { described_class.new(amount,date) }
  # subject(:transaction) { described_class.new }

  before(:each) do
    @transaction = described_class.new(1000, '10-01-2012')
  end

  it 'is initialized with an amount' do
    expect(@transaction.amount).to eq 1000
  end

  it 'is initialized with a date' do
    expect(@transaction.date).to eq '10-01-2012'
  end

end
