describe StatementPrinter do

  let(:transaction){ double(:transaction, end_balance: 1000, amount: 500, date: '10/01/2012', type: "deposit")}
  let(:statement_printer) {described_class.new([transaction])}

  context 'on initialization' do

    it 'is initialized with a statement history' do
      expect(statement_printer.history).to eq([transaction])
    end

  end

  describe '#print_statement' do

    it 'returns the history as a string' do
      expect(statement_printer.print_statement).to include ("10/01/2012 || 500.00 || || 1000.00")
    end

    it 'prints out the whole history' do
      expect{statement_printer.print_statement}.to output("date || credit || debit || balance\n10/01/2012 || 500.00 || || 1000.00\n").to_stdout
    end


  end



end
