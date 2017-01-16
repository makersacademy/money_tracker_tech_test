require 'spec_helper'

describe Withdrawl do
  let!(:withdrawl) do
    Withdrawl.new(100)
  end

  it 'has a numeric value' do
    expect(withdrawl.value).to eq(100)
  end

  it 'has a date stamp on creation' do
    expect(withdrawl.created_date).to eq(Date.today.to_s)
  end
end
