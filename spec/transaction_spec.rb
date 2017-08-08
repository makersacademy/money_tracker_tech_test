require 'transaction.rb'

describe Transaction do
  subject(:transaction) { described_class.new("02/08/2017", 300) }

  it "is initialised with the date set by the user" do
    p transaction
    expect(transaction.date).to eq "02/08/2017"
  end

  it "is initialised with the amount set by the user" do
    expect(transaction.amount).to eq 300
  end

  # describe "#format_for_statement" do
  #   it "prints the transaction date, credit/debit amount and balance" do
  #     tracker.record_credit(1200, transaction = Transaction.new)
  #     expect(transaction.format_for_statement).to eq "07/08/2017 || 1200 || || 2500"
  #   end
  # end
end
