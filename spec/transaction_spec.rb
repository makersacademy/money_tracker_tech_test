require 'transaction'

describe Transaction do

  before do
    @first_transaction = Transaction.new(100, credit = 10)
    @second_transaction = Transaction.new(100, credit = nil, debit = 10)
  end

  it 'saves a date to the transaction' do
    expect(@first_transaction.date.to_s).to include ("08/07/2017")
  end

  it 'can categorise amount as a credit' do
    expect(@first_transaction.credit).to eq(10)
  end

  it 'can categorise amount as a debit' do
    expect(@second_transaction.debit).to eq(10)
  end

  it 'has a balance' do
    expect(@first_transaction.balance).to eq(100)
  end

end
