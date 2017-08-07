describe Transaction do

  let(:transaction) { Transaction.new }

  it { is_expected.to respond_to(:store_transaction).with(3).arguments }

  describe "#list" do
    it "should initialise with an empty list" do
      expect(transaction.list).to eq []
    end
  end

  describe "#store_transaction" do
    it "should store a transaction in list" do
      transaction.store_transaction("07/08/2017", 20, 20)
      expect(transaction.list).to eq([{:date=>"07/08/2017", :amount=>20, :balance=>20}])
    end
  end

end
