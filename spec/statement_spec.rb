require 'statement'

describe Statement do
  RANDOM_AMOUNT = "600.00"
  RANDOM_AMOUNT_2 = "500.00"
  DATE = Date.new(2016,5,16)
  let(:transaction) { double(:transaction, calculate_change: RANDOM_AMOUNT, credit: "0.00", debit: RANDOM_AMOUNT, date: DATE) }
  let(:transaction_2) { double(:transaction, calculate_change: RANDOM_AMOUNT_2, credit: RANDOM_AMOUNT_2, debit: "0.00", date: DATE) }
  let(:transaction_log) { double(:transaction_log, transactions: [transaction, transaction_2])}
  let(:statement) { described_class.new transaction_log }

  describe '#initialize' do
    it 'has a transaction log' do
      expect(statement.transaction_log).to eq(transaction_log)
    end
  end

  describe '#view_statement' do
    it 'prints formatted statement from latest transaction to most recent' do
      STATEMENT_2 = "date || credit || debit || balance\n#{DATE.strftime("%Y/%m/%d")} || 500.00 || || 1100.00\n#{DATE.strftime("%Y/%m/%d")} || || #{RANDOM_AMOUNT} || #{RANDOM_AMOUNT}"
      expect(statement.view_statement).to eq(STATEMENT_2)
    end
  end
end
