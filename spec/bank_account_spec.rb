# method for deposit (object?)
# method for withdrawal
# method to display date, balance, transaction? (objects?)
# method to print statement

require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:transaction) { Transaction.new }
  let(:date) { '14/01/2012' }
  let(:deposit_amount) { 1000.00 }
  let(:withdrawal_amount) { 500.00 }
  # let(:statement) { "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n
  # 10/01/2012 || 1000.00 || || 1000.00 " }

  it 'has a balance of 0' do
    expect(account.balance).to eq 0
  end

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
