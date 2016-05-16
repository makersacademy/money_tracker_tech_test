require 'transaction'

describe Transaction do
  it 'Can make deposit with valid date' do
    today = Date.new
    transaction = Transaction.new(today, 100, 200)
    expect(transaction.date).to eq today
  end

  it 'Can make deposit with valid amount' do
    transaction = Transaction.new(Date.new, 100, 200)
    expect(transaction.amount).to eq 100
  end

  it 'Can make deposit with valid balance' do
    transaction = Transaction.new(Date.new, 100, 200)
    expect(transaction.balance).to eq 200
  end
end
