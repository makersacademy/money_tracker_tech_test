require 'transaction_list'

describe TransactionList do

  let(:transaction) do
    transaction = double('transaction')
  end

  it "can add transactions to a list" do
    subject.add_to_list(transaction)
    expect(subject.list.length).to eq(1)
  end

  it "can show the list" do
    subject.add_to_list(transaction)
    expect(subject.getList).to eq([transaction])
  end

end
