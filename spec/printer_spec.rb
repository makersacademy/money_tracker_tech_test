require 'printer'

describe Printer do
  subject(:printer){ described_class.new()}

  describe '#print_statement' do
    it 'converts the input to output' do
      transactions = [{date: '10-01-2012',debit: nil, credit: 500.00, balance: 500}]
      statement_print = Printer::HEADER +
                        "10/01/2012 || 500.00 || || 500.00\n"
      expect(printer.print_statement(transactions, :descending)).to eq(statement_print)
    end
  end

  describe 'date - filter' do
    it 'ascending sorts the dates from oldest' do
      transactions = [{date: '10-01-2012',debit: nil, credit: 500.00, balance: 500}, {date: '13-01-2012',debit: nil, credit: 2000.00, balance: 2500} ]
      statement_print = Printer::HEADER +
                        "10/01/2012 || 500.00 || || 500.00\n" +
                        "13/01/2012 || 2000.00 || || 2500.00\n"
      expect(printer.print_statement(transactions,:ascending)).to eq(statement_print)
    end
  end
end
