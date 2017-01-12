require 'spec_helper'

describe Account do
  it 'has an opening balance of zero' do
    expect(subject.current_balance).to eq(0)
  end

  it 'can make a deposit' do
    subject.deposit(100)
    expect(subject.current_balance).to eq(100)
  end

  it 'records the date and balance when deposit is made' do
    subject.deposit(100)
    expect(subject.deposit_record).to eq(Date.today.to_s =>
      [100, subject.current_balance])
  end

  it 'can make a withdrawl' do
    subject.withdraw(100)
    expect(subject.current_balance).to eq(-100)
  end

  it 'records the date and balance when withdrawl is made' do
    subject.withdraw(100)
    expect(subject.withdrawl_record).to eq(Date.today.to_s =>
      [100, subject.current_balance])
  end
end
