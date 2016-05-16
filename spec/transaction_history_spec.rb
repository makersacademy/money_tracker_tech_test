require 'transaction_history'
describe TransactionHistory do
  let(:transaction_class) { double(:transaction_class, new: transaction) }
  subject(:history) { described_class.new(transaction_class: transaction_class) }

  it 'creates a transaction as an instance variable' do
    expect(history.transaction_class).to eq transaction
  end

end
