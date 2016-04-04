require 'withdrawal'

describe Withdrawal do
  subject(:withdrawal) { described_class.new(500, "14-01-2012") }

  describe 'Initialization' do

    it 'has an amount' do
      expect(withdrawal.amount).to eq(500)
    end

    it 'has a date' do
      expect(withdrawal.date).to eq('14-01-2012')
    end

  end
end
