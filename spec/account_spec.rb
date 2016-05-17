require 'account'

describe BankAccount do
  subject(:account) { described_class.new }
  let(:new_date) { double :new_date }
  let(:current_balance) {double :current_balance}
  let(:transaction_instance1) { double :transaction_instance1,
                                credit: 3000,
                                date: :new_date,
                                current_balance: 3000}

  let(:transaction_instance2) { double :transaction_instance2,
                                debit: 500,
                                date: :new_date,
                                current_balance: -500 }

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

    xit 'returns the amount that has been put into the account' do
      new_balance = account.balance + transaction_instance1.credit
      account.deposit(transaction_instance1)
      expect(account.current_balance).to eq(new_balance)
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    xit 'returns the amount that has been taken out of the account' do
      new_balance = account.balance - transaction_instance2.debit
      account.withdraw(transaction_instance2)
      expect(account.current_balance).to eq(new_balance)
    end
  end
end
