require 'statement'

describe Statement do
  let(:dummy_history) {double :dummy_history}
  let(:dummy_amount) {20}
  let(:dummy_transaction) {double :dummy_transaction}
  subject(:statement) {described_class.new(dummy_history)}

  describe '#initialize' do

    it 'is initialized with the latest history' do
      expect(statement.latest_history).to eq(dummy_history)
    end
  end


  describe '#monetize' do

    it 'puts the amount in string format with two decimal places' do
      expect(statement.monetize(dummy_amount)).to eq("20.00")
    end
  end

  describe '#credit?' do

    it 'returns true if transaction_type is :credit' do
      expect(statement.credit?(:credit)).to be true
      expect(statement.credit?(:debit)).to be false
    end
  end

  describe '#transaction_type_sorter' do

    before do

      allow(dummy_transaction).to receive(:amount).and_return(dummy_amount)
    end

    it 'puts the transaction amount at index 0 if is a credit' do
      allow(dummy_transaction).to receive(:type).and_return(:credit)
      expect(statement.transaction_type_sorter(dummy_transaction)).to eq([statement.monetize(dummy_amount), ' '])
    end

    it 'puts the transaction amount at index 1 if it is a debit' do
      allow(dummy_transaction).to receive(:type).and_return(:debit)
      expect(statement.transaction_type_sorter(dummy_transaction)).to eq([' ', statement.monetize(dummy_amount)])
    end
  end

end
