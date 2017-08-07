require 'income'

RSpec.describe Income do
  let(:income_description) { :salary }
  let(:income_amount) { 10 }
  subject(:income) { described_class.new(:income_description, :income_amount, '07-08-2017') }
  it { is_expected.to respond_to(:date) }
  it { is_expected.to respond_to(:debit) }
  it { is_expected.to respond_to(:credit) }

  describe "#description" do
    it "should return a description" do
      expect(income.description).to eq :income_description
    end
  end

  describe "#debit" do
    it "should return 0" do
      expect(income.debit).to eq 0
    end
  end

  describe "#credit" do
    it "should be equal to the deposit amount" do
      expect(income.credit).to eq :income_amount
    end
  end

  describe "#date" do
    it "should return the given date" do
      expect(income.date.strftime("%Y-%m-%d")).to eq '2017-08-07'
    end
  end

end
