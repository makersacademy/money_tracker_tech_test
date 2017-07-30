require 'account'

describe Account do
  let(:today) { Time.new.strftime("%d/%m/%Y") }

  it "has an initial balance of 0" do
    expect(subject.balance).to eq(0)
  end

  it { is_expected.to respond_to(:deposit).with(1).argument }

  it "can make a deposit" do
    subject.deposit(10)
    expect(subject.balance).to eq(10)
  end

  it { is_expected.to respond_to(:withdraw).with(1).argument }

  it "can make a withdrawl" do
    subject.deposit(10)
    subject.withdraw(5)
    expect(subject.balance).to eq(5)
  end

  it 'can track debit if balance is in minus' do
    subject.deposit(10)
    subject.withdraw(15)
    expect(subject.debit).to eq(5)
  end

  it 'keeps track of transactions' do
    expect(subject.transactions).to eq([])
    subject.deposit(10)
    expect(subject.transactions.length).to eq(1)
  end

  it 'keeps track of deposits' do
    subject.deposit(10)
    expect(subject.transactions.first.date).to eq(today)
    expect(subject.transactions.first.amount).to eq(10)
    expect(subject.transactions.first.balance).to eq(10)
    expect(subject.transactions.first.debit).to eq(0)
  end

  it 'keeps track of withdrawals' do
    subject.withdraw(10)
    expect(subject.transactions.first.date).to eq(today)
    expect(subject.transactions.first.amount).to eq(10)
    expect(subject.transactions.first.balance).to eq(-10)
    expect(subject.transactions.first.debit).to eq(10)
  end

  it 'keeps track of transactions' do
    subject.deposit(10)
    subject.withdraw(15)
    expect(subject.transactions.count).to eq(2)

    expect(subject.transactions[0].date).to eq(today)
    expect(subject.transactions[0].amount).to eq(10)
    expect(subject.transactions[0].balance).to eq(10)
    expect(subject.transactions[0].debit).to eq(0)

    expect(subject.transactions[1].date).to eq(today)
    expect(subject.transactions[1].amount).to eq(15)
    expect(subject.transactions[1].balance).to eq(-5)
    expect(subject.transactions[1].debit).to eq(5)
  end

end
