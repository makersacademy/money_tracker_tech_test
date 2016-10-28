require "transaction_log"

describe "Transaction Log" do

  before(:each) do
    @transaction_log = Transaction_Log.new
    now = "1985-07-20 21:54:40"
    allow(Time).to receive(:now) { now }
  end

  it 'starts with 0 transactions' do
    expect(@transaction_log.transactions.count).to eq(0)
  end

  it 'can add transactions' do
    @transaction_log.new_transaction(-34)
    @transaction_log.new_transaction(456)
    expect(@transaction_log.transactions.count).to eq(2)
  end


  # it "can can find all of the credits"
  #   transaction_log.new_transaction(@transaction1)
  #
  # end


end
