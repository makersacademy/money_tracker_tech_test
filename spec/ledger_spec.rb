require './lib/ledger.rb'

describe Ledger do
  subject(:my_ledger) { described_class.new }

  describe '#attributes' do
    it 'initializes with an empty transactions array' do
      expect(my_ledger.transactions).to eq([])
    end
  end

  describe '#print_statement' do
    it 'responds to the print_statement method' do
      expect(my_ledger).to respond_to(:print_statement)
    end
    it 'allows me to print a full statement' do
      my_ledger.transactions = [{ amount: 100, date: '07/08/2017' }, { amount: 200, date: '17/08/2017' }]
      expect { my_ledger.print_statement }.to output("date || credit || debit || balance\n" + "17/08/2017 || 200 || || 300\n07/08/2017 || 100 || || 100\n").to_stdout
    end
  end
end
