require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(100, 200) }

  it 'Can make deposit with valid amount' do
    expect(transaction.amount).to eq 100
  end

  it 'Can make deposit with valid balance' do
    expect(transaction.balance).to eq 200
  end

  it '#pretty date' do
    today = Time.new.strftime('%d/%m/%y')
    expect(transaction.pretty_date).to eq today
  end
end
