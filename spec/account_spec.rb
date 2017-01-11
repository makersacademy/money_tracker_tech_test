require 'spec_helper'

describe Account do
  it 'has an opening balance of zero' do
    expect(subject.current_balance).to eq(0)
  end

  it 'can make a deposit' do
    subject.deposit(100)
    expect(subject.current_balance).to eq(100)
  end

  it 'records the date of the deposit transaction' do
    subject.deposit(100)
    expect(subject.deposit_record).to eq(Date.today.to_s => 100)
  end

  it 'can make a withdrawl' do
    subject.withdraw(100)
    expect(subject.current_balance).to eq(-100)
  end

  it 'records the date of the withdrawl transaction' do
    subject.withdraw(100)
    expect(subject.withdrawl_record).to eq(Date.today.to_s => 100)
  end
end
