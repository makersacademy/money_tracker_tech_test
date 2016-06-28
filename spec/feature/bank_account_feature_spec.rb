require 'bank_account'

describe 'Bank account features' do
  it 'allows users to make deposits and withdrawls' do
    account = BankAccount.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect(account.balance).to eq 2500
  end
end
