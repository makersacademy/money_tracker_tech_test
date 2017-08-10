require 'statement_formatter.rb'

describe StatementFormatter do
  subject(:formatter) { described_class.new }
  let(:earning) { double :transaction, date: '02/08/2017', amount: 1300 }
  let(:spending) { double :transaction, date: '07/08/2017', amount: -600 }
  let(:tracker) { double :tracker }

  describe '#create_statement' do
    it 'generates the statement' do
      allow(tracker).to receive(:transactions).and_return([earning, spending])
      expect(formatter.create_statement(tracker.transactions)).to eq "date || earning || spending || balance\n" +
                                                              "02/08/2017 || 1300.00 || || 1300.00\n" +
                                                              "07/08/2017 || || 600.00 || 700.00\n"
    end
  end

  # describe '#format_transaction' do
  #   it 'generates the formatted transaction date and amount for earning' do
  #     expect(formatter.format_transaction(earning)).to eq '02/08/2017 || 1300.00 || || '
  #   end
  #
  #   it 'generates the formatted transaction date and amount for spending' do
  #     expect(formatter.format_transaction(spending)).to eq '02/08/2017 || || 550.00 || '
  #   end
  # end
end
