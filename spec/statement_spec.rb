
describe Statement do
  let(:transactions_log) { double('Transactions_Log') }
  subject(:statement) { described_class.new(transactions_log) }

  let(:time_one) { Time.now }
  let(:time_two) { Time.now }

  let(:transaction_one) { double('Transaction One', time: time_one, debit: 0, credit: 100, balance: 200) }
  let(:transaction_two) { double('Transaction Two', time: time_two, debit: 100, credit: 0, balance: 100) }

  describe '#print_it' do
    before do
      allow(transactions_log).to receive(:history).and_return([transaction_one, transaction_two])
    end

    it 'will print the statement header' do
      expect(statement).to receive(:print_header)
      statement.print_it
    end

    it 'will print each transaction' do
      expect(statement).to receive(:print_each_transaction)
      statement.print_it
    end

    it "will print the account's history to STDOUT" do
      allow(time_one).to receive(:strftime).with('/%d/%m/%y').and_return(Time.now.strftime('/%d/%m/%y'))
      allow(time_two).to receive(:strftime).with('/%d/%m/%y').and_return(Time.now.strftime('/%d/%m/%y'))
      expect { statement.print_it }.to output(" date | credit | debit | balance \n #{Time.now.strftime('/%d/%m/%y')} | 0 | 100 | 100  \n #{Time.now.strftime('/%d/%m/%y')} | 100 | 0 | 200  \n").to_stdout
    end
  end
end
