
require_relative '../lib/balancer'

describe Balancer do
  let(:debit_transaction) { double(:transaction, credit: 0, debit: 50) }
  let(:credit_transaction) { double(:transaction, credit: 50, debit: 0) }

  describe '#update' do
    context 'when the last transaction was a debit' do
      it 'will detract the debit from the balance' do
        expect(subject.update(debit_transaction)).to eq -50
      end
    end
    context 'when the last transaction was a credit' do
      it 'will add the credit to the balance' do
        expect(subject.update(credit_transaction)).to eq 50
      end
    end
  end
end
