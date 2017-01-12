require 'spec_helper'

describe Account do
  let!(:deposit) do
    double('deposit', value: 100, created_date: Date.today.to_s)
  end

  let!(:withdrawl) do
    double('withdrawl', value: 100, created_date: Date.today.to_s)
  end

  it 'has an opening balance of zero' do
    expect(subject.current_balance).to eq(0)
  end

  it 'can make a deposit' do
    subject.deposit(deposit)
    expect(subject.current_balance).to eq(100)
  end

  it 'stores the deposit' do
    subject.deposit(deposit)
    expect(subject.deposit_record).to eq([deposit])
  end

  it 'can make a withdrawl' do
    subject.withdraw(withdrawl)
    expect(subject.current_balance).to eq(-100)
  end

  it 'stores the withdrawl' do
    subject.withdraw(withdrawl)
    expect(subject.withdrawl_record).to eq([withdrawl])
  end
end
