require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new(0, 0, 10) }

  it "has an initial amount of zero" do
    expect(subject.amount).to eq(0)
  end

  it "has a date" do
    allow(subject).to receive(:date) { "30/07/2017" }
    expect(subject.date).to eq "30/07/2017"
  end

  it 'keeps track of account balance' do
    expect(transaction.balance).to eq(0)
  end

  it 'keeps track of account debit' do
    expect(transaction.debit).to eq(10)
  end
end
