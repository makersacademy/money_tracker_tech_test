require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new }
  let(:amount) { 1000 }
  let(:date) { '14/01/2012' }
  let(:details) { {date: date, amount: amount, balance: 0} }

  it 'creates a deposit with a date' do
    transaction.value(date, amount)
    expect(transaction.details).to eq(details)
  end
end
