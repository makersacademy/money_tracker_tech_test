require 'history'

describe History do

  subject(:history) { History.new }
  let(:today) { Date.today }

  it 'receives a deposit' do
    # transaction = Transaction.new(1000, today)
    history.deposit(1000, today)
    p history.all

    expect(history.all.first.amount).to eq(1000)
    expect(history.all.first.date).to eq(today)
  end

end
