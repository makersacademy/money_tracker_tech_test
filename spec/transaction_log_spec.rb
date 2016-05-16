require 'transaction_log'

describe TransactionLog do
  RANDOM_AMOUNT = '%.2f' % rand(1000)
  DATE = Date.new(2016,5,16)
  let(:transaction_log) { described_class.new }
  let(:transaction) { double(:transaction, calculate_change: RANDOM_AMOUNT, credit: nil, debit: RANDOM_AMOUNT, date: DATE) }

  describe '#initialize' do
    it 'has an empty array' do
      expect(transaction_log.transactions).to eq([])
    end
  end

  describe '#log' do
    it 'logs transaction' do
      transaction_log.log(transaction)
      expect(transaction_log.transactions).to include(transaction)
    end
  end

  describe '#calculate_balance' do
    it 'calculates the balance' do
      transaction_log.log(transaction)
      expect(transaction_log.calculate_balance).to eq(RANDOM_AMOUNT)
    end
  end

  describe '#print_statement' do
    it 'prints a formatted statement' do
      STATEMENT = "date || credit || debit || balance\n#{DATE.strftime("%Y/%m/%d/")} || || #{RANDOM_AMOUNT} || #{RANDOM_AMOUNT}"
      transaction_log.log(transaction)
      expect(transaction_log.print_statement).to eq(STATEMENT)
    end
  end

end
