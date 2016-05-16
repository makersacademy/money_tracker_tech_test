require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(amount) }
  let(:amount) { double 100 }

  it 'initialises with a date' do
    expect(subject.date).to eq(Date.new)
  end
end
