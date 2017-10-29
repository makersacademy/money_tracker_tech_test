
describe TransactionLog do
  let(:transaction) { double(:transaction, credit: 50, debit: 0) }
  let(:balancer) { double(:balancer) }

  describe '.instance' do
    context 'on first call' do
      it 'will return an instance of TransactionLog' do
        expect(subject.class.instance).to be_an_instance_of(TransactionLog)
      end
    end
    context 'on calls thereafter' do
      it 'will return the memoized instance' do
        memoized_instance = subject.class.instance.object_id
        expect(subject.class.instance.object_id).to eq memoized_instance
      end
    end
  end

  describe '#log' do
    before do
      allow(balancer).to receive(:update).with(transaction).and_return(50)
    end
    it 'will log the transaction passed in' do
      expect { subject.log(transaction) }.to change { subject.transactions }.from([]).to([transaction])
    end

    it 'will log the new balance' do
      expect { subject.log(transaction) }.to change { subject.balances }.from([]).to([50])
    end
  end
end
