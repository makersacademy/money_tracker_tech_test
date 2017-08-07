require 'earning'

describe Earning do
  let(:earning_amount) { 10 }
  subject(:earning) { described_class.new(:earning_amount, '07-08-2017') }
  it { is_expected.to respond_to(:date) }
  it { is_expected.to respond_to(:debit) }
  it { is_expected.to respond_to(:credit) }

  describe "#debit" do
    it "should return 0" do
      expect(earning.debit).to eq nil
    end
  end

  describe "#credit" do
    it "should be equal to the deposit amount" do
      expect(earning.credit).to be :earning_amount
    end
  end

  describe "#date" do
    it "should return the given date" do
      expect(earning.date.strftime("%Y-%m-%d")).to eq '2017-08-07'
    end
  end

end
