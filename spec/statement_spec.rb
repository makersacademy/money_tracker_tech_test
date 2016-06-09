require 'statement'

describe Statement do
  RANDOM_AMOUNT = 600
  RANDOM_AMOUNT_sf = "600.00"
  RANDOM_AMOUNT_2 = 500
  RANDOM_AMOUNT_2_sf = "500.00"
  DATE = Date.new(2016,5,16)
  let(:transaction) { double(:transaction, calculate_change: RANDOM_AMOUNT, credit: 0, debit: RANDOM_AMOUNT, date: DATE, deposit_or_withdrawal?: :withdrawal) }
  let(:transaction_2) { double(:transaction, calculate_change: RANDOM_AMOUNT_2, credit: RANDOM_AMOUNT_2, debit: 0, date: DATE, deposit_or_withdrawal?: :deposit) }
  let(:account) { double(:account, transactions: [transaction, transaction_2])}
  let(:statement) { described_class.new account }

  describe '#initialize' do
    it 'has a transaction log' do
      expect(statement.account).to eq(account)
    end
  end

  describe '#view_statement' do
    context 'viewing it normally' do
      it 'prints formatted statement from latest transaction to most recent' do
        STATEMENT = "date || credit || debit || balance\n#{DATE.strftime("%Y/%m/%d")} || #{RANDOM_AMOUNT_2_sf} || || 1100.00\n#{DATE.strftime("%Y/%m/%d")} || || #{RANDOM_AMOUNT_sf} || #{RANDOM_AMOUNT_sf}"
        expect(statement.view_statement).to eq(STATEMENT)
      end
    end

    context 'only viewing deposit' do
      it 'filters through just the deposit' do
        STATEMENT_deposit = "date || credit || debit || balance\n#{DATE.strftime("%Y/%m/%d")} || #{RANDOM_AMOUNT_2_sf} || || 1100.00"
        expect(statement.view_statement(filter: :deposit)).to eq(STATEMENT_deposit)
      end
    end

    context 'only viewing withdrawal' do
      it 'filters through just the withdrawal' do
        STATEMENT_deposit = "date || credit || debit || balance\n#{DATE.strftime("%Y/%m/%d")} || || #{RANDOM_AMOUNT_sf} || #{RANDOM_AMOUNT_sf}"
        expect(statement.view_statement(filter: :withdrawal)).to eq(STATEMENT_deposit)
      end
    end

    context 'viewing ascending order' do
      it 'gives you the statement in the reverse order' do
        STATEMENT = "date || credit || debit || balance\n#{DATE.strftime("%Y/%m/%d")} || || #{RANDOM_AMOUNT_sf} || #{RANDOM_AMOUNT_sf}\n#{DATE.strftime("%Y/%m/%d")} || #{RANDOM_AMOUNT_2_sf} || || 1100.00"
        expect(statement.view_statement(order: :ascending)).to eq(STATEMENT)
      end
    end
  end
end
