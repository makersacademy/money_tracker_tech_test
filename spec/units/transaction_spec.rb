require 'transaction'

describe Transaction do
  let(:dummy_client) {double :dummy_client}
  let(:dummy_amount) {1000}
  let(:dummy_deposit) {double :dummy_deposit}
  subject(:transaction) {described_class.new(dummy_amount, dummy_client, dummy_deposit)}

  describe '#initialize' do

    before do
      Timecop.freeze(Time.local(1990, 1, 2, 13, 05))
    end

    after do
      Timecop.return
    end

    it 'is initialized with the current date to record transaction' do
      expect(transaction.date).to eq(Time.now)
    end

  end
end
