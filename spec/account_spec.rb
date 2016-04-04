require 'account'

describe Account do
  let(:statement) { double :statement }
  let(:statement_klass) { double :statement_klass, new: statement, add_transaction: nil}
  subject(:account) { described_class.new(statement_klass) }

  describe 'deposit' do
    it 'calls add_transaction on the statement' do
      expect(statement).to receive(:add_transaction)
      account.deposit(1000, '10-12-2012')
    end
  end

  describe 'withdrawal' do
    it 'saves a withdrawal' do
      expect(statement).to receive(:add_transaction)
      account.withdrawal(500, '10-12-2012')
    end
  end
end
