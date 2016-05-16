require 'transaction_history'

describe TransactionHistory do
  subject(:history) { described_class.new }
  let(:deposit) do
    double(:transaction,
           pretty_date: Time.new.strftime('%d/%m/%y'),
           amount: rand(100..500),
           balance: rand(-1000..10_000))
  end

  let(:withdraw) do
    double(:transaction,
           pretty_date: Time.new.strftime('%d/%m/%y'),
           amount: rand(-500..-100),
           balance: rand(-1000..10_000))
  end

  it 'Can add transaction' do
    history.add_transaction(deposit)
    expect(history.all_transactions).to include deposit
  end

  it 'Prints statement' do
    history.add_transaction(deposit)
    history.add_transaction(withdraw)
    p history.print_statement
    expect(history.print_statement).to eq 'dsds'
  end
end
