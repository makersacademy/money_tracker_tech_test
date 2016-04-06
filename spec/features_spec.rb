require 'bank_account'

describe "features" do

  it 'should initialized a  bank account with a balance of 0' do
    account = BankAccount.new("Tester Testerson")
    expect(account.balance).to eq(0)
  end

  it 'should increase the balance correctly when making a deposit' do
    account = BankAccount.new("Tester Testerson")
    deposit = Deposit.new(account, 10, "01/01/2016")
    expect(account.balance).to eq 0
    deposit.finalize
    expect(account.balance).to eq 10
  end

  it 'should only be able to finalize each deposit once' do
    account = BankAccount.new("Tester Testerson")
    deposit = Deposit.new(account, 10, "01/01/2016")
    expect(account.balance).to eq 0
    deposit.finalize
    expect(account.balance).to eq 10
    deposit.finalize
    expect(account.balance).to eq 10
  end

end
