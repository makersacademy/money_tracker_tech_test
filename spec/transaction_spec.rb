require 'transaction'

describe Transaction do

  let(:transaction) { described_class.new }

  it 'can save a date to the transaction' do
    expect(transaction.date.to_s).to include ("2017-08-08")
  end

  it 'can categorise amount as a credit' do
    transaction.set_attributes(10, 50)
    expect(transaction.credit).to eq(10)
    expect(transaction.balance).to eq(50)
  end

  it 'can categorise amount as a debit' do
    second_transaction = Transaction.new()
    second_transaction.set_attributes(-40, 40)
    expect(second_transaction.debit).to eq(40)
    expect(second_transaction.balance).to eq(40)
  end

  it "can return the transaction credit" do
    transaction.set_attributes(10, 50)
    expect(transaction.get_credit).to eq(10)
  end

  it "can return the transaction debit" do
    second_transaction = Transaction.new()
    second_transaction.set_attributes(-60, 20)
    expect(second_transaction.get_debit).to eq(60)
  end

end
