require 'printer'

describe Printer do

  subject(:printer) {described_class.new}
  let(:statement) {double :statement, :credits => {"10-01-2012": 1000},
                                      :debits => {"11-01-2012": 400} }

  it 'prints the statement credits and debits' do
    expect{printer.print_records(statement)}
    .to output("date || credit || debit || balance\n10-01-2012 || 1000 || ||\n11-01-2012 || || 400 ||\n").to_stdout
  end

end
