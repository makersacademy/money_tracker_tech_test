require 'earning'

RSpec.describe Earning do
  let(:deposit_amount) {10}
  subject(:deposit) { described_class.new(:deposit_amount, '07-08-2017') }
  it { is_expected.to respond_to(:date) }
  it { is_expected.to respond_to(:debit) }
  it { is_expected.to respond_to(:credit) }

  describe "#debit" do
    it "should return 0" do
      expect(deposit.debit).to eq 0
    end
  end

  describe "#credit" do
    it "should be equal to the deposit amount" do
      expect(deposit.credit).to eq :deposit_amount
    end
  end

  describe "#date" do
    it "should return the given date" do
      expect(deposit.date.strftime("%Y-%m-%d")).to eq '2017-08-07'
    end
  end

end
