require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:transaction) { TransactionHistory.new }
  let(:date) { '14/01/2012' }
  let(:deposit_amount) { 1000.00 }
  let(:withdrawal_amount) { 500.00 }

  it 'accepts a deposit, changes the balance' do
    account.deposit(date, deposit_amount)
    expect(account.balance).to eq deposit_amount
  end

  it 'allows a withdrawal, changes the balance' do
    account.deposit(date, deposit_amount)
    account.withdraw(date, withdrawal_amount)
    expect(account.balance).to eq deposit_amount - withdrawal_amount
  end

end
