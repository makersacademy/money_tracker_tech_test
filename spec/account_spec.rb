require 'account'

describe Account do
  let(:statement) {double(:statement) } 
  let(:args) {{statement:statement}}
  let(:account) {described_class.new(args)}


  describe '#check_balance' do
    it 'should return the balance' do
      expect(statement).to receive(:latest_balance)
      account.check_balance
    end
  end
  
  describe '#statement' do

    it 'it should be a object' do
      expect(account.statement).to eq(statement)
    end
  end

  describe '#desposit' do
    it 'should initiate a new transaction with positve number' do
      expect(statement).to receive(:new_transaction).with(100)
      account.deposit(100)
    end
  end

  describe '#withdraw' do
    it 'should initiate a new transaction with negative number' do
      expect(statement).to receive(:new_transaction).with(-100)
      account.withdraw(100)
    end
  end

  describe '#statement' do
    it 'should get the statement' do
      expect(statement).to receive(:complete_log)
      account.print_statement
    end
  end
end