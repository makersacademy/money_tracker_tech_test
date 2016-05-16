require 'transaction_history'

describe TransactionHistory do
  subject(:history) { described_class.new }

  it 'Logs transaction date' do
    history.add_transaction('16/05/2016', 100, 200)
    expect(history.all_transactions).to include { '16/05/2016' }
  end

  it 'Logs transaction amount' do
    history.add_transaction('16/05/2016', 100, 200)
    expect(history.all_transactions).to include { 100 }
  end

  it 'Logs account balance after transaction' do
    history.add_transaction('16/05/2016', 100, 200)
    expect(history.all_transactions).to include { 200 }
  end
end
