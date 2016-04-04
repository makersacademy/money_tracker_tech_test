require 'account'

describe Account do
  subject(:account)       { described_class.new }
  let(:deposit_amount)    { 1000 }
  let(:withdrawal_amount) { 700 }

  describe '#initialize' do
    it 'initializes with a balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'initializes with an empty transaction log' do
      expect(account.statement.count).to eq 0
    end
  end

  describe '#deposit' do
    before(:example) { account.deposit(deposit_amount) }

    it 'adds the deposit amount to the account balance' do
      expect(account.balance).to eq deposit_amount
    end

    it 'logs the transaction' do
      expect(account.statement.count).to eq 1
    end

    context 'if the amount to be deposited is not valid' do
      it 'raises an error' do
        expect { account.deposit(-500) }
          .to raise_error('Invalid amount')
      end
    end
  end

  describe '#withdraw' do
    context 'if the user has sufficient balance' do
      before(:example) do
        account.deposit(deposit_amount)
        account.withdraw(withdrawal_amount)
      end

      it 'subtracts the amount from the account balance' do
        expect(account.balance).to eq(deposit_amount - withdrawal_amount)
      end

      it 'logs the transaction' do
        expect(account.statement.count).to eq 2
      end
    end

    context 'if the user does not have sufficient balance' do
      it 'raises an error' do
        expect { account.withdraw(withdrawal_amount) }
          .to raise_error('Insufficient funds')
      end
    end

    context 'if the amount to be withdrawn is not valid' do
      it 'raises an error' do
        expect { account.withdraw(-500) }
          .to raise_error('Invalid amount')
      end
    end
  end

  describe '#statement' do
    before(:example) do
      account.deposit(deposit_amount)
      account.withdraw(withdrawal_amount)
    end

    it "returns a list of the user's transactions" do
      expect(account.statement.count).to eq 2
    end
  end
end
