require 'transaction'

describe Transaction do
  let(:amount) { double :amount }
  let(:date) { double :date }
  subject(:transaction) { described_class.new(amount, date) }

  it { is_expected.to respond_to(:amount) }

  it { is_expected.to respond_to(:date) }


  it 'initialises with an amount' do
    expect(transaction.amount).to eq(amount)
  end

  it 'initialises with a date' do
    expect(transaction.date).to eq(date)
  end

end
