require 'date'
require 'statement_printer'

describe StatementPrinter do
  subject(:statement_printer) { described_class.new }
  let(:transaction_log) do
    [{type: :credit,
      amount: 1000,
      balance: 1000,
      date: Date.today
    },
    { type: :debit,
      amount: 700,
      balance: 300,
      date: Date.today
    }]
  end

  it 'prints a formatted account statement' do
    expect { statement_printer.print_out(transaction_log) }
      .to output(
      %q(      date ||     credit ||      debit ||    balance
04/04/2016 ||    1000.00 ||            ||    1000.00
04/04/2016 ||            ||     700.00 ||     300.00
)).to_stdout
  end
end
