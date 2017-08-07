require 'transaction'

describe Transaction do

  before do
    @transaction = Transaction.new(100, credit = 10)
  end

  it 'saves a date to the transaction' do
    expect(@transaction.date.to_s).to include ("2017-08-07")
  end

  it 'can categorise amount as a credit' do
    expect(@transaction.credit).to eq(10)
  end

  it 'can categorise amount as a debit' do
    second_transaction = Transaction.new(100, credit = nil, debit = 10)
    expect(second_transaction.debit).to eq(10)
  end

  it 'has a balance' do
    expect(@transaction.balance).to eq(100)
  end

end
