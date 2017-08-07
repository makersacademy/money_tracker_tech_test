require 'ledger'

describe Ledger do
  it { is_expected.to be_a Ledger }

  describe 'Initialisation' do
    it 'Has a transactions array' do
      expect(subject.transactions).to be_a Array
    end

    it 'Begins with no transactions' do
      expect(subject.transactions).to be_empty
    end
  end
end
