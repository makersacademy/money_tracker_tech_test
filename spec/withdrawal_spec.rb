require 'spec_helper'

describe Withdrawal do
  let(:account) { double("BankAccount", :balance => 10) }
  subject(:withdrawal) { described_class.new(account, "5", "01/01//2016") }

  it 'responds to the #finalize method' do
    expect(withdrawal).to respond_to(:finalize)
  end
end
