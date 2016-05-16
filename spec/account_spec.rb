require 'account'

describe BankAccount do
  subject(:account) { described_class.new }
  # let(:amount) { double 100 }
  let(:new_date) { double :new_date }
  let(:transaction_instance1) { double :transaction,
                                credit: 3000,
                                date: :new_date }

  let(:transaction_instance2) { double :transaction,
                                debit: 500,
                                date: :new_date }

  it 'has an array of transactions' do
    expect(account.transactions).to eq []
  end

  describe '#current_balance' do
    it 'shows the current balance' do
      expect(account.current_balance).to eq(0)
    end
  end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'returns the amount that has been put into the account' do
      new_balance = account.balance + transaction_instance1.credit
      account.deposit(transaction_instance1)
      expect(account.current_balance).to eq(new_balance)
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'returns the amount that has been taken out of the account' do
      new_balance = account.balance - transaction_instance2.debit
      account.withdraw(transaction_instance2)
      expect(account.current_balance).to eq(new_balance)
    end
  end
end
