require 'spec_helper'

describe "Features" do

  it 'should initialize with a bank account with a balance of 0' do
    account = create_account
    expect(account.balance).to eq(0)
  end

  it 'should increase the balance correctly when making a deposit' do
    account = create_account
    deposit = deposit_10(account)
    expect(account.balance).to eq 0
    deposit.finalize
    expect(account.balance).to eq 10
  end

  it 'should only be able to finalize each deposit once' do
    account = create_account
    deposit = deposit_10(account)
    expect(account.balance).to eq 0
    deposit.finalize
    expect(account.balance).to eq 10
    deposit.finalize
    expect(account.balance).to eq 10
  end

  it 'should decrease the balance correctly when making a withdrawal' do
    account = create_account
    deposit = deposit_10(account)
    deposit.finalize
    expect(account.balance).to eq 10
    withdrawal = withdraw_10(account)
    expect(account.balance).to eq 10
    withdrawal.finalize
    expect(account.balance).to eq 0
  end

  it 'should only be able to finalize each withdrawal once' do
    account = create_account
    deposit = deposit_20(account)
    deposit.finalize
    expect(account.balance).to eq 20
    withdrawal = withdraw_10(account)
    expect(account.balance).to eq 20
    withdrawal.finalize
    expect(account.balance).to eq 10
    withdrawal.finalize
    expect(account.balance).to eq 10
  end

  it 'should add finalized deposits to the transactions array' do
    account = create_account
    deposit = deposit_20(account)
    deposit.finalize
    expect(account.transactions).to include(deposit)
  end

  it 'should add finalized withdrawals to the transactions array' do
    account = create_account
    deposit = deposit_20(account)
    deposit.finalize
    withdrawal = withdraw_10(account)
    withdrawal.finalize
    expect(account.transactions).to include(withdrawal)
  end

  it 'should be able to show a statement which includes the balance' do
    account = create_account
    deposit = deposit_20(account)
    deposit.finalize
    output = "date || credit || debit || balance\n01/01/2016 || 20 || || 20\n"
    expect{ account.show_statement }.to output(output).to_stdout
  end

  it 'should correctly update the balance of a finalized deposit' do
    account = create_account
    deposit = deposit_20(account)
    deposit.finalize
    expect(deposit.balance).to eq 20
  end

  it 'should correctly update the balance of a finalized withdrawal' do
    account = create_account
    deposit = deposit_20(account)
    deposit.finalize
    withdrawal = withdraw_5(account)
    withdrawal.finalize
    expect(withdrawal.balance).to eq 15
  end

end
