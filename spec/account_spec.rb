require 'account'

describe BankAccount do
  it 'initialises with a balance of 0' do
    expect(subject.balance).to eq(0)
  end
end
