require 'statement'

describe Statement do
  RANDOM_AMOUNT = "600.00"
  RANDOM_AMOUNT_2 = "500.00"
  DATE = Date.new(2016,5,16)
  let(:transaction) { double(:transaction, calculate_change: RANDOM_AMOUNT, credit: "0.00", debit: RANDOM_AMOUNT, date: DATE, is_deposit?: false, is_withdrawal?: true) }
  let(:transaction_2) { double(:transaction, calculate_change: RANDOM_AMOUNT_2, credit: RANDOM_AMOUNT_2, debit: "0.00", date: DATE, is_deposit?: true, is_withdrawal?: false) }
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
        STATEMENT = "date || credit || debit || balance\n#{DATE.strftime("%Y/%m/%d")} || #{RANDOM_AMOUNT_2} || || 1100.00\n#{DATE.strftime("%Y/%m/%d")} || || #{RANDOM_AMOUNT} || #{RANDOM_AMOUNT}"
        expect(statement.view_statement).to eq(STATEMENT)
      end
    end

    context 'only viewing deposits' do
      it 'filters through just the deposits' do
        STATEMENT_DEPOSITS = "date || credit || debit || balance\n#{DATE.strftime("%Y/%m/%d")} || #{RANDOM_AMOUNT_2} || || 1100.00"
        expect(statement.view_statement(withdrawals:false, deposits:true)).to eq(STATEMENT_DEPOSITS)
      end
    end

    context 'only viewing withdrawals' do
      it 'filters through just the withdrawals' do
        STATEMENT_DEPOSITS = "date || credit || debit || balance\n#{DATE.strftime("%Y/%m/%d")} || || #{RANDOM_AMOUNT} || #{RANDOM_AMOUNT}"
        expect(statement.view_statement(withdrawals:true, deposits:false)).to eq(STATEMENT_DEPOSITS)
      end
    end

    context 'viewing ascending order' do
      it 'gives you the statement in the reverse order' do
        STATEMENT = "date || credit || debit || balance\n#{DATE.strftime("%Y/%m/%d")} || || #{RANDOM_AMOUNT} || #{RANDOM_AMOUNT}\n#{DATE.strftime("%Y/%m/%d")} || #{RANDOM_AMOUNT_2} || || 1100.00"
        expect(statement.view_statement(ascending:true)).to eq(STATEMENT)
      end
    end
  end
end
