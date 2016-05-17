require 'transaction'

describe Transaction do

  subject(:transaction) { described_class.new("10/01/2012", 1000.00, 0, 1000.00) }

  describe '#initalize' do
    it 'initializes with date' do
      expect(transaction.date).to eq "10/01/2012"
    end
    it 'initializes with credit amount' do
      expect(transaction.credit).to eq 1000.00
    end
    it 'initializes with debit amount of zero' do
      expect(transaction.debit).to eq 0
    end
    it 'initializes with balance amount' do
      expect(transaction.balance).to eq 1000.00
    end
  end

end
