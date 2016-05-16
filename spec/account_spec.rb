require 'account'

describe Account do
  let(:account) { described_class.new }

  describe '#initialize' do
    it 'has a balance of 0' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'adds amount to balance' do
      RANDOM_AMOUNT = rand(10)
      account.deposit(RANDOM_AMOUNT)
      expect(account.balance).to eq(RANDOM_AMOUNT)
    end
  end
end
