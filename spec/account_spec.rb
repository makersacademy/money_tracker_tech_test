require 'spec_helper'

describe Account do
  it 'has an opening balance of zero' do
    expect(subject.current_balance).to eq(0)
  end

  it 'can make a deposit' do
    subject.deposit(100)
    expect(subject.current_balance).to eq(100)
  end

  it 'can make a withdrawl' do
    subject.deposit(100)
    subject.withdraw(50)
    expect(subject.current_balance).to eq(50)
  end
end
