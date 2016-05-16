require 'transaction_history'
describe TransactionHistory do
  let(:transaction) { double(:transaction, new: transaction) }
  subject(:log) { described_class.new(transaction: transaction) }
  let(:transaction) { double(:transaction,  value: nil, details: nil) }
  let(:amount) { 1000.00 }
  let(:date) { '14/01/2012' }

  it 'creates a transaction as an instance variable' do
    expect(log.transaction).to eq transaction
  end

  it 'has an empty history upon creation' do
    expect(log.history).to eq []
  end

end
