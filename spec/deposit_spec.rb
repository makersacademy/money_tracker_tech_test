require 'deposit'

describe Deposit do
  subject(:deposit) { described_class.new(1000, "10-01-2012") }

  # describe 'amount' do
  #   it 'stores the amount of the deposit' do
  #     deposit.amount(1000)
  #     expect(deposit.total).to eq(1000)
  #   end
  # end
  #
  # describe 'date' do
  #   it 'stores the date of the deposit' do
  #     deposit.date('10-01-2012')
  #     expect(deposit.date_of_deposit).to eq('10-01-2012')
  #   end
  # end

  describe 'Initialization' do
    it 'has an amount' do
      expect(deposit.amount).to eq(1000)
    end

    it 'has a date' do
      expect(deposit.date).to eq('10-01-2012')
    end

  end

end
