require 'transaction_list'

describe TransactionList do

  it "can add transactions to a list" do
    transaction = [@date= "2017-08-07", @credit=10, @debit=nil, @balance=100]
    subject.add_to_list(transaction)
    expect(subject.list.length).to eq(1)
  end

end
