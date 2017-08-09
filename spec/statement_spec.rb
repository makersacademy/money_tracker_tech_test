require 'statement'
require 'tracker'
require 'account'

describe Statement do

  let(:date)      { '2017-02-02' }
  let(:credit)    { 500 }
  let(:debit)     { nil }
  let(:balance)   { 1000 }
  let(:entry)     { double :entry, date: '2017-06-06', credit: 1000, debit: nil}
  let(:entry2)    { double :entry, date: '2017-06-06', credit: nil, debit: 500}
  let(:tracker)   { double :tracker, account: account, initial_balance: 0 }
  let(:account)   { double :account, entries: [entry, entry2] }
  let(:statement) { Statement.new(tracker) }

  it { is_expected.to respond_to(:tracker) }

  describe '#compose_line' do
    it 'prepares a single statement line' do
      expect(statement.compose_line(date, credit, debit, balance)).to eq "2017-02-02 || 500 ||  || 1000" 
    end
  end

  describe '#compose_body' do
    it 'prepares the body of the statement' do
      allow(tracker).to receive(:get_current_balance).with(account, entry).and_return(1000)
      allow(tracker).to receive(:get_current_balance).with(account, entry2).and_return(500)
      expect(statement.compose_body).to eq "2017-06-06 || 1000 ||  || 1000\n2017-06-06 ||  || 500 || 500"
    end 
  end 
  describe '#print_header' do
    it "prints the table header" do
      expect{ statement.print_header }.to output("date || credit || debit || balance\n").to_stdout
    end 
  end 
end 
