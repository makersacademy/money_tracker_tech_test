require 'bank_account'

describe BankAccount do

  subject(:account) { described_class.new("Tester Testerson") }

  it 'should have a balance attribute' do
    expect(account).to respond_to(:balance)
  end

  it 'should be initialized with a balance of 0' do
    expect(account.balance).to eq(0)
  end

end
