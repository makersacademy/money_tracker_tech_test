require 'account'

describe Account do
  let(:date) { double :date }
  let(:formatted_date) { double :date }
  let(:amount) { double :integer }
  let(:statement_header) { Account::STATEMENT_HEADER }
  subject(:account) { described_class.new }

  before do
    allow(Date).to receive(:today).and_return(date)
  end

  context '#initialize' do
    it 'account has a transaction history' do
      expect(account.transactions).to eq []
    end
  end

  context '#deposit' do
    before do
      allow(Date).to receive(:today).and_return(date)
      account.deposit amount
    end

    it 'creates a new credit record' do
      expect(account.transactions).to include({ date: date, credit: amount, debit: nil })
    end
  end

  context '#withdraw' do
    before do
      allow(Date).to receive(:today).and_return(date)
      account.withdraw amount
    end

    it 'creates a new debit record' do
      expect(account.transactions).to include({ date: date, credit: nil, debit: amount })
    end
  end

  context '#statement' do
    it 'creates a statement' do
      expect(account.statement).to eq statement_header
    end

    it 'creates a statement in reverse cronological order' do
      allow(date).to receive(:strftime).and_return(formatted_date)

      account.deposit 1
      account.deposit 1
      account.withdraw 1

      statement = "date || credit || debit || balance" +
                  "\n#{formatted_date} ||  || 1.00 || 1.00" +
                  "\n#{formatted_date} || 1.00 ||  || 2.00" +
                  "\n#{formatted_date} || 1.00 ||  || 1.00"

      expect(account.statement).to eq statement
    end
  end
end
