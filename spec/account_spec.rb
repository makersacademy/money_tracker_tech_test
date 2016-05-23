require 'account'
require 'date'


describe Account do

  subject(:account) { described_class.new }

  let(:today) { Date.today }

  it "records a deposit" do
    account.deposit(1000, today)
    p account.history
    expect(account.history).to include(1000, today)
    # expect(account.history).to have_received(:deposit).with(1000)
  end

end
