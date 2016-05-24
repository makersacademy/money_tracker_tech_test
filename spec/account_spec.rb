require 'account'
require 'date'

describe Account do

  subject(:account) { described_class.new(history: history) }

  let(:history) { instance_spy("History") }
  let(:statement) { File.read("spec/support/statement.txt") }
  let(:today) { Date.today }

  it "records a deposit" do
    account.deposit(100, today)
    expect(history).to have_received(:deposit).with(100, today)
  end

  it "records a withdrawl" do
    account.withdraw(50, today)
    expect(history).to have_received(:withdraw).with(50, today)
  end

  it "can return a statement" do

    transactions = [
      Transaction.new(1000, Date.parse("10-01-2012")),
      Transaction.new(2000, Date.parse("13-01-2012")),
      Transaction.new(-500, Date.parse("14-01-2012"))
    ]

    allow(history).to receive(:transactions).and_return(transactions)
    output = spy(:output)
    account.print_statement(output)
    expect(output).to have_received(:puts).with(statement)
  end

end
