require 'deposit'


describe Deposit  do
  let(:deposit_class) {described_class}
  it'intilializes with an amount' do
    deposit = deposit_class.new(100)
    expect(deposit.amount).to eq(100)
  end
end