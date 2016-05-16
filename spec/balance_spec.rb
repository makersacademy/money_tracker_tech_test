require 'balance'

describe Balance do
  
  let(:start_balance) {Balance::STARTBALANCE}
  let(:balance) {described_class.new}
  
  describe '#initialize' do
    it 'should initialize with the STARTBALANCE' do
      expect(balance.amount).to eq(start_balance)
    end
  end

  describe '#update' do
    context 'amount is positive' do
      it 'should add amount to balance' do
        expect{balance.update(50)}.to change{balance.amount}.by(50)
      end
    end

     context 'amount is negative' do
      it 'should add amount to balance' do
        expect{balance.update(-50)}.to change{balance.amount}.by(-50)
      end
    end
  end
end