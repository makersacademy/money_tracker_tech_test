
require_relative '../lib/statement'

describe Statement do
  let(:transaction_log) { double(:transaction_log) }
  subject { described_class.new(transaction_log: transaction_log) }

  let(:time_one) { Time.now }
  let(:time_two) { Time.now }

  let(:transaction_one) { double('Transaction One', time: time_one, debit: 0, credit: 100) }
  let(:transaction_two) { double('Transaction Two', time: time_two, debit: 100, credit: 0) }

  describe '#print_it' do
    before do
      allow(transaction_log).to receive(:transactions).and_return([transaction_one, transaction_two])
      allow(transaction_log).to receive(:balances).and_return([100, 0])
    end

    it "will print the account's history to STDOUT" do
      allow(time_one).to receive(:strftime).with('%d/%m/%y').and_return(Time.now.strftime('%d/%m/%y'))
      allow(time_two).to receive(:strftime).with('%d/%m/%y').and_return(Time.now.strftime('%d/%m/%y'))
      expect { subject.print_it }.to output(" date | credit | debit | balance \n #{Time.now.strftime('%d/%m/%y')} | 0 | 100 | 0 \n #{Time.now.strftime('%d/%m/%y')} | 100 | 0 | 100 \n").to_stdout
    end
  end
end
