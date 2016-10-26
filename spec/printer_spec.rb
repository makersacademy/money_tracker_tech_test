require "printer"

describe "printer" do

  before(:each) do
    @account = double(:account)
    @account_info = [{"amount" => 434, "date" => "1985-07-21 21:55:40 +0100", "balance" => 400},{"amount" => -34, "date" => "1985-07-20 21:54:40 +0100", "balance" => -34}]
    allow(@account).to receive(:running_balance).and_return(@account_info)
  end

  it "prints a normal statement out the total in the correct format" do
    @printer = Printer.new
    expect(@printer.standard_print(@account)).to eq(
    "date || credit || debit || balance\n21/07/1985 || 434.00 || || 400.00\n20/07/1985 || || 34.00 || -34.00")
  end

  it "prints a reverse dated statement in the correct format" do
    @printer = Printer.new
    expect(@printer.reverse_print(@account)).to eq(
    "date || credit || debit || balance\n20/07/1985 || || 34.00 || -34.00\n21/07/1985 || 434.00 || || 400.00")
  end

end
