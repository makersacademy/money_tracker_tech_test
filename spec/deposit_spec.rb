require 'spec_helper'

describe Deposit do
  let!(:deposit) do
    Deposit.new(100)
  end

  it 'has a numeric value' do
    expect(deposit.value).to eq(100)
  end

  it 'has a date stamp on creation' do
    expect(deposit.created_time).to eq(Date.today.to_s)
  end
end
