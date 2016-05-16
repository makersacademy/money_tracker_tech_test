require 'statement'

describe Statement do
  let(:balance) {double(:balance)}
  let(:balance_klass) {double(:balance_class, new: balance) }
  let(:deposit) {double(:deposit, amount:nil, name:nil, date:nil)}
  let(:deposit_klass) {double(:deposit_class, new: deposit) } 
  let(:args) {{balance_class:balance_klass, deposit_class:deposit_klass}}
  let(:statement) {described_class.new(args)}
  
  describe'#current_balance' do
    it'should know about balance' do
      expect(statement.balance).to eq(balance)
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
end