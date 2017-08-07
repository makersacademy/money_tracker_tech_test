require './lib/ledger.rb'

describe Ledger do
  subject(:my_ledger) { described_class.new }

  describe '#attributes' do
    it 'initializes with an empty transactions array' do
      expect(my_ledger.transactions).to eq([])
    end
  end
end
