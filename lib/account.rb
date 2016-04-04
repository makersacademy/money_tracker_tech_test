require_relative 'transaction.rb'

class Account

  attr_reader :balance, :statement

  def initialize(transaction_klass = Transaction, statement_printer_klass = StatementPrinter)
    @balance = 0
    @statement = []
    @transaction = transaction_klass
    @printer = statement_printer_klass
  end

  def deposit(amount, date)
    transaction = @transaction.new({amount: amount, type: 'deposit', date: date, start_balance: @balance})
    @balance = transaction.end_balance
    @statement.push(transaction)
  end

  def withdraw(amount, date)
    transaction = @transaction.new({amount: amount, type: 'withdrawl', date: date, start_balance: @balance})
    @balance = transaction.end_balance
    @statement.push(transaction)
  end

  def print_statement
    printer = @printer.new(@statement)
    printer.print_statement
  end

end
