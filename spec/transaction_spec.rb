require 'transaction'

describe Transaction do

  before do
    @transaction = Transaction.new(100, 10, credit = true)
  end

  it 'saves a date to the transaction' do
    expect(@transaction.date.to_s).to include ("2017-08-07")
  end

  it 'can categorise as a credit' do
    expect(@transaction.credit).to eq(true)
  end

  it 'can categorise as a debit' do
    expect(@transaction.debit).to eq(false)
  end

  it 'has an amount' do
    expect(@transaction.amount).to eq(10)
  end

  it 'has a balance' do
    expect(@transaction.balance).to eq(100)
  end

end
