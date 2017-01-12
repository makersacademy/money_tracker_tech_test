require 'spec_helper'

describe Deposit do
  it 'has a numeric value' do
    subject = Deposit.new(100)
    expect(subject.value).to eq(100)
  end
end
