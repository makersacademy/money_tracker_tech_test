require 'history'

describe History do

  subject(:history) { History.new }
  let(:today) { Date.today }

  it 'receives a deposit' do
    history.deposit(1000, today)
    expect(history.transactions.first.amount).to eq(1000)
    expect(history.transactions.first.date).to eq(today)
  end

  it 'receives a withdrawal' do
    history.withdraw(500, today)
    expect(history.transactions.last.amount).to eq(-500)
    expect(history.transactions.last.date).to eq(today)
  end

end
