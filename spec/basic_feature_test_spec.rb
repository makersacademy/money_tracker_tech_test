require 'account'
require 'printer'

describe 'Basic feature tests' do
  subject(:account){ Account.new(Printer.new)}

  before do
    account.deposit(1000, '10-01-2012')
    account.deposit(2000, '13-01-2012')
    account.withdraw(500, '14-01-2012')
  end

  describe 'Deposits and withdraws' do
    it 'a user can deposit and withdraw and that changes the balance' do
      expect(account.balance).to eq(2500)
    end
  end

  describe 'Statements' do
    it 'the account keeps statement of the date, amount and balance' do
      stament_example = {date: '10-01-2012', debit: nil, credit: 1000, balance: 1000}
      expect(account.show_statement).to include(stament_example)
    end
  end

  describe 'Statment printing' do
    it 'prints the overview of the her last statements' do
      statement_print = "date || credit || debit || balance\n" +
                       "14/01/2012 || || 500.00 || 2500.00\n" +
                       "13/01/2012 || 2000.00 || || 3000.00\n" +
                       "10/01/2012 || 1000.00 || || 1000.00\n"
       expect(account.print_statement(:descending)).to eq(statement_print)
    end
  end
end
