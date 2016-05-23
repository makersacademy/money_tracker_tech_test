require 'transaction'
require 'date'

describe Transaction do

  it "is initialized with an amount and a date" do
    debit1 = Transaction.new(200, date = Date.today)
    expect(debit1.amount).to eq(200)
    expect(debit1.date).to eq Date.today
  end

end
