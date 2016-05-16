describe Transaction do

  let(:transaction){ described_class.new(1000) }

  before(:each) do
    allow(Date).to receive(:new).and_return("15/05/2016")
  end

  context 'initialization' do
    it 'initializes with the current date and given amount' do
      # allow(date).to receive(:new).and_return("16/05/2016")
      expect(transaction.date).to eq "15/05/2016"
    end
  end
end
