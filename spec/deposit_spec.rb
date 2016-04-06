require 'spec_helper'

describe Deposit do
  
  let(:account) { double("BankAccount", :balance => 10) }
  subject(:deposit) { described_class.new(account, "5", "01/01//2016") }

  it 'responds to the #finalize method' do
    expect(deposit).to respond_to(:finalize)
  end

  it 'responds to the #balance method' do
    expect(deposit).to respond_to(:balance)
  end

end
