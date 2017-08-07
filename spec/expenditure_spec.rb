require 'expense'

RSpec.describe Expense do
  let(:expense_description) {:coffee}
  let(:expense_cost) {10}
  subject(:expense) { described_class.new(:expense_description, :expense_cost, '07-08-2017') }
  it { is_expected.to respond_to(:date) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:debit) }
  it { is_expected.to respond_to(:credit) }

  describe "#description" do
    it "should return a description" do
      expect(expense.description).to eq :expense_description
    end
  end

  describe "#debit" do
    it "should return the expense" do
      expect(expense.debit).to eq :expense_cost
    end
  end

  describe "#credit" do
    it "should be equal to the deposit amount" do
      expect(expense.credit).to eq 0
    end
  end

  describe "#date" do
    it "should return the given date" do
      expect(expense.date.strftime("%Y-%m-%d")).to eq '2017-08-07'
    end
  end

end
