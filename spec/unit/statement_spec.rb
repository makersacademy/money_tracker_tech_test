describe Statement do
  let(:date)      { Date.parse('01-01-2017') }
  let(:type)      { :credit }
  let(:amount)    { 100 }
  let(:balance)   { 200 }
  let(:statement) { described_class.new }

  describe '#display' do
    it { is_expected.to respond_to :display }

    it 'Prints a record to STDOUT' do
      expect { statement.display(date, type, amount, balance) }
        .to output("01/01/2017 || 100 ||  || 200\n").to_stdout
    end
  end
end
