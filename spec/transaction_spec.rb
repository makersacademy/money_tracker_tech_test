
describe Transaction do
  let(:credit) { 0 }
  let(:debit) { 50 }
  let(:balance) { 100 }
  let(:current_time) { Time.now }
  subject(:transaction) { described_class.new(credit: credit, time: current_time, debit: debit, balance: balance) }

  describe 'attributes' do
    context 'on init' do

      it 'will assign the credited amount' do
        expect(transaction.credit).to eq(0)
      end

      it 'will assign the debited amount' do
        expect(transaction.debit).to eq(50)
      end

      it 'will assign the credited amount' do
        expect(transaction.balance).to eq(100)
      end

      it 'will assign the credited amount' do
        expect(transaction.time).to eq(current_time)
      end
      
    end
  end
end
