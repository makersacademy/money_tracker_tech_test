require 'transactions'

RSpec.describe Transactions do
  let(:income) { double('income') }
  let(:expense) { double('expense') }
  subject(:transactions) { described_class.new }

  it { is_expected.to respond_to(:transaction_list) }
  it { is_expected.to respond_to(:add_transaction).with(4).arguments }


  describe "#transaction_list" do
    it "should be an array" do
      expect(transactions.transaction_list).to be_an(Array)
    end

    it "should initialize empty" do
      expect(transactions.transaction_list).to be_empty
    end
  end

  describe "#add_transaction" do
    context "receiving income" do
      it "should add an income object to array" do
        expect{ transactions.add_transaction(Income, "test", 20, "1st Jan 2017") }.to change{ transactions.transaction_list.length }.from(0).to(1)
      end
    end
  end



end
