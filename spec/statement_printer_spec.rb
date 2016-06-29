require "statement"

describe Statement do

  subject(:printed_statement){ described_class.new(account) }

  let(:account) {double :account, :balance => 0}
  let(:account_with_history) {double :account_with_history, :statement_history => [
        {date: Time.local(2012, 1, 10), amount: 1000, balance: 1000},
        {date: Time.local(2012, 1, 13), amount: 2000, balance: 3000},
        {date: Time.local(2012, 1, 14), amount: -500, balance: 2500}
      ]}

  describe 'printing account statement history' do
    context 'it initializes with an account that has a balance of 0' do
      it 'initializes with an account balance of 0' do
        expect(printed_statement.account.balance).to eq (0)
      end
    end

    context 'printing out the statement' do
      it 'prints the headers if there is no history available' do
        expect(printed_statement.title).to eq "date || credit || debit || balance\n"
      end
    end

    context 'printing out the statement' do
      it 'prints out the account history' do
        printed_statement.add_history(account_with_history)
        expect(printed_statement.print_out).to eq "date || credit || debit || balance\n"
      end
    end
  end
end