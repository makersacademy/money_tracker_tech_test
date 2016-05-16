require 'transaction'

describe Transaction do 
  DATE1 = Date.new(2012,1,10)
  DATE2 = Date.new(2012,1,13)
  DEBIT1 = 1000
  BALANCE1 = 1000
  subject(:transaction) { described_class.new(date: DATE1,credit: nil, debit: DEBIT1, balance: BALANCE1) } 

  describe '#date' do
    it 'returns the date supplied' do 
      expect(transaction.date).to equal DATE1 
    end
  end

  describe '#debit' do
    it 'returns the amount supplied' do
      expect(transaction.debit).to equal DEBIT1
    end
  end

  describe '#balance' do
    it 'returns the amount supplied' do
      expect(transaction.balance).to equal BALANCE1
    end
  end

end
