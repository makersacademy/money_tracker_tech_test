require 'deposit'

describe Deposit do
  let(:account) { double("BankAccount", :balance => 10) }
  subject(:deposit) { described_class.new(account, "5", "01/01//2016") }

  it '' do
  # account = double("BankAccount", :balance => 0)
  # account = BankAccount.new
  end
end
