require 'statement'
require 'matrix'

describe Statement do
  let(:balance) {double(:balance)}
  let(:balance_klass) {double(:balance_class, new: balance) }
  let(:deposit) {double(:deposit, amount:nil, name:nil, date:nil)}
  let(:deposit_klass) {double(:deposit_class, new: deposit) } 
  let(:args) {{balance_class:balance_klass, deposit_class:deposit_klass}}
  let(:log) {[['01/01/2016', 100, 100], ['01/01/2016',50, 50]]}
  let(:statement) {described_class.new(args)}
  
  describe'#last_balance' do
    it'should know about balance' do
      expect(statement.balance).to eq(balance)
    end

    it'should get the balance of the last transaction' do
      allow(statement).to receive(:log).and_return(log)
      expect(statement.latest_balance).to eq(50)
    end

    it 'should throw error if there are no transaction yet' do
      expect{statement.latest_balance}.to raise_error("No transaction yet")
    end
  end

  describe'#new_transaction' do
    context 'the amount is a positive' do
      it 'should call on create_deposit method' do
        expect(statement).to receive(:create_deposit)
        statement.new_transaction(1)
      end
    end

    context 'the amount is negative' do
      it 'should call on create_withdraw method' do
        expect(statement).to receive(:create_withdraw)
        statement.new_transaction(-1)
      end
    end
  end

  describe '#complete_log' do
    it 'should return a matrix with all relevant infos'  do
      expect(statement.complete_log).to be_a(Array)
    end
  end
end