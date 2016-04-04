require 'account'

describe Account do
  let(:statement) { double :statement }
  let(:statement_klass) { double :statement_klass, new: statement, add_transaction: nil}
  let(:deposit) { double :deposit }
  subject(:account) { described_class.new(statement_klass) }

  describe 'Initialization' do
    it 'has a balance of zero' do
      expect(account.balance).to eq(0)
    end

    # it 'has no deposits' do
    #   expect(account.deposits.empty?).to be true
    # end
    #
    # it 'has no withdrawals' do
    #   expect(account.withdrawals.empty?).to be true
    # end
  end

  describe 'deposit' do
    it 'calls add_transaction on the statement' do
      expect(statement).to receive(:add_transaction).with(deposit)
      account.deposit(1000, '10-12-2012')
    end
  end

  describe 'withdrawal' do
    it 'saves a withdrawal' do
      account.withdrawal(500, '14-01-2012')
      expect(account.withdrawals.length).to eq(1)
    end
  end
end
