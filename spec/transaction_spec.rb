require 'transaction'

describe Transaction do
  it 'initialises with a date' do
    expect(subject.date).to eq(Date.new)
  end
end
