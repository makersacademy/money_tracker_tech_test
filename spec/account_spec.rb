require 'account'

describe BankAccount do
  subject(:account) { described_class.new }
  let(:new_date) { double :new_date }
  let(:current_balance) {double :current_balance}
  let(:transaction_instance1) { double :transaction_instance1,
                                credit: 3000,
                                :'current_balance=' => nil,
                                date: :new_date }

  let(:transaction_instance2) { double :transaction_instance2,
                                debit: 500,
                                :'current_balance=' => nil,
                                date: :new_date }

  it 'has an array of transactions' do
    expect(account.transactions).to eq []
  end

  describe '#current_balance' do
    it 'shows the current balance' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'returns the amount that has been put into the account' do
      expect { account.deposit(transaction_instance1) }.to change{account.balance}.by(transaction_instance1.credit)
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'returns the amount that has been taken out of the account' do
      expect { account.withdraw(transaction_instance2) }.to change{account.balance}.by(-transaction_instance2.debit)
    end
  end
end
