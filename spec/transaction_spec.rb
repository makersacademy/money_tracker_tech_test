require 'transaction'

describe Transaction do
  let(:credit) { double :credit }
  let(:debit) { double :debit }
  let(:date) { double :date }
  subject(:transaction) { described_class.new(credit: credit, debit: debit, date: date) }

  it 'initialises with a debited amount' do
    expect(transaction.debit).to eq(debit)
  end

  it 'initialises with a credited amount' do
    expect(transaction.credit).to eq(credit)
  end

  it 'initialises with a date' do
    expect(transaction.date).to eq(date)
  end

end
