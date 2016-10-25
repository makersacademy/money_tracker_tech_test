require "printer"

describe "printer" do

before(:each) do
  @account = double(:account)
  @account_info = [[-34, "1985-07-20 21:54:40 +0100", -34], [434, "1985-07-21 21:55:40 +0100", 400]]
  allow(@account).to receive(:running_balance).and_return(@account_info)
end

  it "prints out the total in the correct format" do
    @printer = Printer.new
    expect(@printer.print(@account)).to be_a(String)
  end

  # it "can print the date in the correct format" do
  #   set_time = [[-34, "20/07/1985", -34], [434, "21/07/1985", 400]]
  #   expect(format_time(@account_info)).to eq(set_time)
  # end



end
# "date || credit || debit || balance
# 14/01/2012 || || 500.00 || 2500.00
# 13/01/2012 || 2000.00 || || 3000.00
# 10/01/2012 || 1000.00 || || 1000.00"
