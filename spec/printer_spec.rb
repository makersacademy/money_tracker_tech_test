require 'printer'

describe Printer do
  subject(:printer){ described_class.new()}

  describe '#print_statement' do
    it 'converts the input to output' do
      statement_example = [{date: '10-01-2012',debit: nil, credit: 500.00, balance: 500}]
      statement_print = Printer::HEADER +
                        "10/01/2012 || 500.00 || || 500.00\n"
      expect(printer.print_statement(statement_example)).to eq(statement_print)
    end
  end
end
