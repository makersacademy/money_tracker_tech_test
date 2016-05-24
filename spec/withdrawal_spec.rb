describe Withdrawal do

  let(:current_date){ double :current_date }
  let(:withdrawal){ described_class.new(1000, current_date) }

  before(:each) do
    allow(current_date).to receive(:strftime).and_return("15/05/2016")
  end

  context 'initialization' do
    it 'initializes with the current date and given amount' do
      expect(withdrawal.date).to eq "15/05/2016"
      expect(withdrawal.amount).to eq -1000
    end
  end

end
