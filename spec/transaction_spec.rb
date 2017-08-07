require 'transaction.rb'

describe Transaction do
  subject(:transaction) { described_class.new }

  before do
   new_time = Time.local(2017, 8, 7)
   Timecop.freeze(new_time)
  end

  it "is initialised with the current date" do
    expect(transaction.date).to eq ("07/08/2017")
  end

  after do
    Timecop.return
  end
end
