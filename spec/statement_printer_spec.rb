describe StatementPrinter do

  let(:transaction){ double(:transaction, end_balance: 1000, amount: 500, date: '10/01/2012', type: :deposit)}
  let(:transaction_two) { double(:transaction, end_balance: 750, amount: 250, date: '11/01/2012', type: :withdrawl)}
  let(:statement_printer) {described_class.new([transaction, transaction_two])}

  context 'on initialization' do

    it 'is initialized with a statement history' do
      expect(statement_printer.history).to eq([transaction, transaction_two])
    end

  end

  describe '#print_statement' do

    it 'returns the history as a string' do
      expect(statement_printer.print_statement).to include ("10/01/2012 || 500.00 || || 1000.00")
      expect(statement_printer.print_statement).to include ("11/01/2012 || || 250.00 || 750.00")
    end

    it 'prints out the whole history' do
      expect{statement_printer.print_statement}.to output("date || credit || debit || balance\n11/01/2012 || || 250.00 || 750.00\n10/01/2012 || 500.00 || || 1000.00\n").to_stdout
    end

    it 'returns only deposits if called with deposits' do
      expect{statement_printer.print_statement("deposits")}.to output("date || credit || debit || balance\n10/01/2012 || 500.00 || || 1000.00\n").to_stdout
    end


  end



end
