require 'account'

describe Account do

  it 'can be initialized with a custom amount' do
    statement = double("statement")
    list = double("list")
    allow(statement).to receive(:display_transactions).and_return("date || credit || debit || balance\n 08-08-2017||10||||100")
    account = Account.new(10, list, statement)
    expect(account.balance).to eq(10)
  end

  it 'changes the balance on a deposit' do
    subject.deposit(5)
    expect(subject.balance).to eq(5)
  end

  it 'creates a new transaction on deposit' do
    subject.deposit(5)
    expect(subject.transactions.list).not_to eq([])
  end

  it 'does not change the balance if £0 deposited' do
    subject.deposit(0)
    expect(subject.balance).to eq(0)
  end

  it 'changes the balance on withdrawl' do
    subject.deposit(10)
    subject.withdraw(5)
    expect(subject.balance).to eq(5)
  end

  it 'creates a new transaction on withdrawl' do
    subject.deposit(10)
    subject.withdraw(5)
    expect(subject.transactions.list.length).to eq(2)
  end

  it 'does not change the balance if £0 withdrawn' do
    subject.withdraw(0)
    expect(subject.balance).to eq(0)
  end

  it 'client can see their balance' do
    subject.deposit(20)
    expect(subject.show_balance).to eq(20)
  end

  it 'allows user to see their statement' do
    statement = double("statement")
    list = double("list")
    account = Account.new(10, list, statement)
    allow(statement).to receive(:display_transactions).and_return("date || credit || debit || balance 08-08-2017||10||||100")
    p statement.display_transactions
    expect { subject.display_statement }.to output("date || credit || debit || balance\n").to_stdout
  end

end
