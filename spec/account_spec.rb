require 'account'

describe Account do

  subject(:account) {described_class.new(transaction_klass)}

  let(:transaction_klass) {double :transaction_klass}
  let(:transaction) {double :transaction}

  before do
    allow(transaction_klass).to receive(:new).and_return(transaction)
  end

  describe '#initialize' do

    it 'initializes with a balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'initializes with an empty statement' do
      expect(account.statement).to be_empty
    end

  end

  describe '#credit' do

    before(:each) do
      allow(transaction).to receive_messages(date: '1/1/16', credit: 500, debit: 0, balance: 500)
    end

    it 'allows a user to add a credit' do
      account.credit(amount: 500, date: '1/1/16')
      expect(account.balance).to eq 500
    end

    it 'adds a transaction to the statement with the correct date' do
      account.credit(amount: 500, date: '1/1/16')
      expect(account.statement[0].date).to eq '1/1/16'
    end

    it 'adds a transaction to the statement with the correct credit ammount' do
      account.credit(amount: 500, date: '1/1/16')
      expect(account.statement[0].credit).to eq 500
    end

    it 'adds a transaction to the statement with the correct current balance' do
      allow(transaction).to receive(:balance).and_return(500)
      account.credit(amount: 500, date: '1/1/16')
      expect(account.statement[0].balance).to eq account.balance
    end

  end

  describe '#debit' do

    before(:each) do
      allow(transaction).to receive_messages(date: '1/1/16', credit: 0, debit: 500, balance: -500)
    end

    it 'allows a user to make a debit' do
      account.debit(amount: 500, date: '1/1/16')
      expect(account.balance).to eq -500
    end

    it 'adds a transaction to the statement with the correct date' do
      account.debit(amount: 500, date: '1/1/16')
      expect(account.statement[0].date).to eq '1/1/16'
    end

    it 'adds a transaction to the statement with the correct debit ammount' do
      account.debit(amount: 500, date: '1/1/16')
      expect(account.statement[0].debit).to eq 500
    end

    it 'adds a transaction to the statement with the correct current balance' do
      account.debit(amount: 500, date: '1/1/16')
      expect(account.statement[0].balance).to eq account.balance
    end

  end

  describe '#print' do

    it 'prints a formatted statement to the terminal' do
      allow(transaction).to receive_messages(date: '1/1/16', credit: 500, debit: nil, balance: 500)
      account.credit(amount: 500, date: '1/1/16')
      expect { account.print_statement }
        .to output("\"date || credit || debit || balance\"\n\"#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\"\n").to_stdout
    end

  end

end
