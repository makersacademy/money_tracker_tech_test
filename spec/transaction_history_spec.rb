require 'transaction_history'

describe TransactionHistory do
  subject(:history) { described_class.new }
  let(:transaction) { double(:transaction) }

  it 'Can add transaction' do
    history.add_transaction(transaction)
    expect(history.all_transactions).to include transaction
  end

  it 'Prints statement' do
    history.add_transaction(transaction)
    allow(transaction).to receive(:pretty_date).and_return(Time.new.strftime('%d/%m/%y'))
    allow(transaction).to receive(:amount).and_return(250)
    allow(transaction).to receive(:balance).and_return(92_385_647_856)
    expect(history.print_statement).to eq 'dsds'
  end
end
