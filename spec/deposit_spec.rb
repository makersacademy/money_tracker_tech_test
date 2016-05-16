require 'deposit'


describe Deposit  do
  
  let(:deposit){described_class.new(100)}
  
  before :each do
    Timecop.freeze(Time.local(2016))
  end
  
  describe '#amount' do
    it'intilializes with an amount' do
      expect(deposit.amount).to eq(100)
    end
  end

  describe '#date' do
    it'returns the date in "%d-%m-%Y" format ' do
      expect(deposit.date).to eq('01/01/2016')
    end
  end
end