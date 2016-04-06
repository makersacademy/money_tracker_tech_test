require 'client'

describe Client do
  subject(:Client) {described_class.new}
  let(:account_klass) {double :account_klass}

  it 'can make a deposit' do
    subject.make_deposit(5000)
    expect(subject.account_klass.balance).to eq 5000
  end

  it 'can make a withdrawal' do
    subject.make_withdrawal(1000)
    expect(subject.account_klass.balance).to eq -1000
  end

  it 'prints their bank statement' do
    subject.make_deposit(5000)
    subject.print_statement
    expect(subject.print_statement).to eq "Date | credit | debit | balance\n06/04/2016 | 5000 |      | 5000 "
  end
end
