require 'spending'

describe Spending do
  let(:cost) { 10 }
  subject(:spending) { described_class.new(:cost, '07-08-2017') }
  it { is_expected.to respond_to(:date) }
  it { is_expected.to respond_to(:debit) }
  it { is_expected.to respond_to(:credit) }

  describe "#debit" do
    it "should return the expense" do
      expect(spending.debit).to eq :cost
    end
  end

  describe "#credit" do
    it "should be equal to the deposit amount" do
      expect(spending.credit).to be nil
    end
  end

  describe "#date" do
    it "should return the given date" do
      expect(spending.date.strftime("%Y-%m-%d")).to eq '2017-08-07'
    end
  end

end
