require 'account'

describe Account do
  let(:statement) {double(:statement)}
  let(:statement_klass) {double(:statement_class, new: statement) } 
  let(:args) {{statement_class:statement_klass}}
  let(:start_balance) {Balance::STARTBALANCE}
  let(:account) {described_class.new(args)}


  describe '#check_balance' do
    it 'should return the balance' do
      expect(statement).to receive(:last_balance)
      account.check_balance
    end
  end
  
  describe '#statement' do

    it 'it should be a object' do
      expect(account.statement).to eq(statement)
    end
  end

  describe '#desposit' do
    it 'should initiate a new transaction' do
      expect(statement).to receive(:new_transaction).with(100)
      account.deposit(100)
    end
  end

  describe '#withdraw' do
    it 'should initiate a new transaction' do
      expect(statement).to receive(:new_transaction).with(100)
      account.deposit(100)
    end
  end
end