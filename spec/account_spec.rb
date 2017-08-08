require 'account'

describe Account do

  it 'can be initialized with a custom amount' do
    statement = double("statement")
    list = double("list")
    allow(statement).to receive_message_chain(:get_list, :display_transactions).and_return("date || credit || debit || balance\n 08-08-2017||10||||100")
    account = Account.new(list, statement)
    account.create_entry(10)
    expect(account.balance).to eq(10)
  end

  it 'changes the balance on credit entry' do
    subject.create_entry(5)
    expect(subject.balance).to eq(5)
  end

  it 'creates a new transaction on debit entry' do
    subject.create_entry(5)
    expect(subject.transactions.list).not_to eq([])
  end

  it 'does not change the balance if £0 deposited' do
    subject.create_entry(0)
    expect(subject.balance).to eq(0)
  end

  it 'changes the balance on withdrawl' do
    subject.create_entry(10)
    subject.create_entry(-5)
    expect(subject.balance).to eq(5)
  end

  it 'creates a new transaction on withdrawl' do
    subject.create_entry(10)
    subject.create_entry(-5)
    expect(subject.transactions.list.length).to eq(2)
  end

  it 'does not change the balance if £0 withdrawn' do
    subject.create_entry(0)
    expect(subject.balance).to eq(0)
  end

  it 'allows user to see their statement' do
    statement = double("statement")
    list = double([])
    allow(statement).to receive(:list).and_return("date || credit || debit || balance 08-08-2017||10||||100")
    allow(statement).to receive(:display_transactions).and_return("date || credit || debit || balance 08-08-2017||10||||100")
    account = Account.new(10, list, statement)
    expect { subject.display_statement }.to output("date || credit || debit || balance\n").to_stdout
  end

end
