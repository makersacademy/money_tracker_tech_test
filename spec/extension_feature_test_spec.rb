require 'account'
require 'printer'

describe Account do
  subject(:account){ described_class.new(Printer.new)}

  before do
    account.deposit(1000, '10-01-2012')
    account.deposit(2000, '13-01-2012')
    account.withdraw(500, '14-01-2012')
  end

  describe 'Statement filters' do
    it 'sorts the statements according to ascending or descending' do
      statement_print = "date || credit || debit || balance\n" +
                        "10/01/2012 || 1000.00 || || 1000.00\n" +
                        "13/01/2012 || 2000.00 || || 3000.00\n" +
                        "14/01/2012 || || 500.00 || 2500.00\n"
      expect(account.print_statement(:ascending)).to eq(statement_print)
    end

    it 'only includes withdrawals if selected' do
      statement_print = "date || credit || debit || balance\n" +
                        "14/01/2012 || || 500.00 || 2500.00\n"
      expect(account.print_statement(:debit)).to eq(statement_print)
    end

    it 'only includes desposits if selected' do
      statement_print = "date || credit || debit || balance\n" +
                        "13/01/2012 || 2000.00 || || 3000.00\n" +
                        "10/01/2012 || 1000.00 || || 1000.00\n"
      expect(account.print_statement(:credit)).to eq(statement_print)
    end
  end
end
