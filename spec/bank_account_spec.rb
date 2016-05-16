require 'bank_account'

describe BankAccount do

  subject(:bank_account) { described_class.new }

  describe '#initialize' do
    it 'starts with a balance of 0' do
      expect(bank_account.balance).to be_zero
    end

    it 'starts with an empty transaction history' do
      expect(bank_account.transactions).to be_empty
    end
  end

end
