require 'bank'

describe Bank do
  subject(:bank) {described_class.new}

  describe 'balance' do
    it 'balance starts at 0' do
      expect(bank.account_balance).to eq 0
    end
  end

  describe 'deposit' do
    it 'can be made' do
      bank.make_deposit(100)
      expect(bank.account_balance).to eq(100)
    end
  end

  describe 'withdrawal' do
    it 'can be made' do
      bank.make_deposit(200)
      bank.make_withdrawal(100)
      expect(bank.account_balance).to eq(100)
    end
  end
end
