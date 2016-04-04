require 'deposit'

describe Deposit do
  subject(:deposit) { described_class.new(1000, "10-01-2012") }

  describe 'Initialization' do
    it 'has an amount' do
      expect(deposit.amount).to eq(1000)
    end

    it 'has a date' do
      expect(deposit.date).to eq('10-01-2012')
    end

  end
end
